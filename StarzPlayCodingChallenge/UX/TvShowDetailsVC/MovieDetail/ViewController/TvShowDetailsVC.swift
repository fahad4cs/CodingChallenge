//
//  TvShowDetailsVC.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/2023.
//

import UIKit
import ANActivityIndicator
import Combine
import SDWebImage

class TvShowDetailsVC: UIViewController {
    
    // MARK: - IBOutlets of the ViewController
    @IBOutlet weak var imgPoster: UIImageView! /** imgPoster:   Image Poster  **/
    @IBOutlet weak var lblSaesonTitle: UILabel! /** lblSaesonTitle:  Saesons Title **/
    @IBOutlet weak var lblSaesonSubTitle: UILabel!  /** lblSaesonSubTitle:  Saeson Sub Title **/
    @IBOutlet weak var lblDescription: UILabel!  /**  lblDescription: Seasons  description **/
    @IBOutlet weak var collectionSeason: UICollectionView! /** collectionSeason:  UICollectionView to show the seasons selections**/
    @IBOutlet weak var tblEpisodes: UITableView! /**  tblEpisodes: UITableView to show the episodes List**/
    
    // MARK: - Data memebers
    private var subscriptions: Set<AnyCancellable> = .init() /** subscriptions:  to observe the changes from view model**/
    var viewModel: MovieListVM? /* viewModel:   View Model object**/
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDependencies()
        bindViews()
        getApiData()

    }
    
    /**  To ensure the Dependency injections **/
    func setDependencies() {
        let authInterceptor = OAuthValidationRequestInterceptor(with: InternalOAuthAuthenticator())
        let networkCall = NetworkCallFactory().createNetworkCall(with: authInterceptor)
        let jsonParser = JsonParser()
        let listRepo = MovieListRepository(network: networkCall, parser: jsonParser)
        self.viewModel = MovieListVM(movieListRepository: listRepo)
    }
    
    /**  Call of APi **/
    func getApiData() {
        viewModel?.getData()
        
    }

     /**  Return Response from View Model  **/
     func bindViews() {
        guard let viewModel = viewModel else { return }
         
         /**  viewModel list listner when data received it will be refelected **/
        viewModel.$listModel.receive(on: DispatchQueue.main).dropFirst().sink(receiveValue: { [unowned self] listModel in
            
            self.lblSaesonTitle.text = listModel?.name
            let year = listModel?.firstAirDate?.Date(withFormat: "yyyy-MM-dd")
            let numOfSeasons = "\(listModel?.numberOfSeasons ?? 1) Seasons"
            self.lblSaesonSubTitle.text = "\(year ?? "None") | \(numOfSeasons) | R"
            self.collectionSeason.reloadData()
            self.collectionSeason.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
            
            self.imgPoster.sd_setImage(with: URL(string: "\(ServerUrl.stagingImageUrl)\(listModel?.backdropPath ?? "")"), placeholderImage: UIImage(named: "placeHolderPoster"))
            
            DispatchQueue.main.async {
                self.lblDescription.text = listModel?.overview ?? ""
                self.lblDescription.addTrailing(with: "...", moreText: "Readmore", moreTextFont: UIFont(name: "Helvetica-Oblique", size: 17.0)!, moreTextColor: .red)
            }
            
           
        }).store(in: &subscriptions)
         
         /**  viewModel list listner when data received it will be refelected  for Episodes**/
         viewModel.$isSeasonDetail.receive(on: DispatchQueue.main).dropFirst().sink(receiveValue: { [unowned self] isSeasonDetail in
             if isSeasonDetail {
                 self.tblEpisodes.reloadData()
             }
            
         }).store(in: &subscriptions)
         
         /**  viewModel list listner when data received it will be refelected  for Errors**/
        viewModel.$apiError.receive(on: DispatchQueue.main).dropFirst().sink(receiveValue: { _ in
        }).store(in: &subscriptions)

        viewModel.$showSpinner.receive(on: DispatchQueue.main).dropFirst().sink(receiveValue: { showSpinner in
            showSpinner ? ANActivityIndicatorPresenter.shared.showIndicator() :            ANActivityIndicatorPresenter.shared.hideIndicator()
        }).store(in: &subscriptions)
    }
    // MARK: - Show Alerts
    func showAlertWith(stringElement: String) {
        self.showAlertSingleCompletionOneBtn(title: "Alert!!!", message: stringElement, buttonTilte: "OK") {
                
        }
    }
    
    // MARK: - Actions
    @IBAction func actions(_ sender: Any) {
        guard let button = sender as? UIButton, let actionTag = ActionTag(rawValue: button.tag) else {
           return
        }
        
        switch actionTag {
        case .play:
            let videoPlayerVC = Player(videoURL: URL(string: ServerUrl.video)!)
            present(videoPlayerVC, animated: true, completion: nil)
        case .watchlist:
            showAlertWith(stringElement: "\(actionTag.description) tapped")
            return
        default:
            showAlertWith(stringElement: "\(actionTag.description) tapped")
        }
    }
    
}
/** used for the Seasons Horizontal scroll  selection */
// MARK: - TableView Episodes
extension TvShowDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.seasonDetailList?.episodes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.cellIndetifier, for: indexPath) as! EpisodeCell
        let seasonObj = viewModel?.seasonDetailList?.episodes![indexPath.row]
        cell.setDataWith(episode: seasonObj!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
// //      AV Player
        let videoPlayerVC = Player(videoURL: URL.init(string: ServerUrl.video)!)
        present(videoPlayerVC, animated: true, completion: nil)
        
// //        YouTube Player
//        let videoID = "JvDvvFFliK8"
//        let youTubePlayerVC = YouTubePlayerViewController(videoID: videoID)
//        present(youTubePlayerVC, animated: true, completion: nil)
    }

}
/** used for the Seasons Horizontal scroll  selection */
// MARK: - CollectionView Seasons 
extension TvShowDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let cell = collectionView.cellForItem(at: indexPath) {
            if cell.isSelected {
                // Cell is already selected, deselect it
                cell.isSelected = false
  
                return false
            } else {
                // Cell is not selected, proceed with selection
                return true
            }
        }

        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.listModel?.numberOfSeasons ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeasonTitleCell.cellIndetifier, for: indexPath) as! SeasonTitleCell
        cell.setDataWith(seasonNumber: indexPath.row + 1)
        cell.isSelected = false // indexPath.row == 0 ? true : false
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 28
        let width  = Int((view.frame.width-20)/3)
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("yes tusi thk wa")
        let seasonNum = viewModel?.listModel?.seasons![indexPath.row].seasonNumber
        self.viewModel?.getSeasonDetail(seasonNum: seasonNum! + 1)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

    }
    
}
