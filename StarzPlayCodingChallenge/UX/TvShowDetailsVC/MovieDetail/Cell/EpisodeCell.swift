//
//  EpisodeCell.swift
//  CodingChallenge
//
//  Created by Apple on 22/11/2023.
//

import UIKit
import SDWebImage

/** EpisodeCell:  Cell to show the content in uitable view cell  **/
class EpisodeCell: UITableViewCell {
    
    static let cellIndetifier = "EpisodeCell" /** cellIndetifier:  Cell Identifier **/
    
    @IBOutlet weak var imgThumbnail: UIImageView!  /** imgThumbnail:  Episode image **/
    @IBOutlet weak var lblTitle: UILabel! /** lblTitle:  Episode title **/
    @IBOutlet weak var btnDownload: UIButton! /** btnDownload:  Download image **/
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /** actionDownload:  Implement the downloading here **/
    @IBAction func actionDownload(_ sender: Any) {
        
    }
    
    /** setDataWith:  function to set data inside the cell **/
    func setDataWith(episode:Episode) {
        self.lblTitle.text = episode.name
        let url = "\(ServerUrl.stagingImageUrl)\(episode.stillPath ?? "")"
        self.imgThumbnail.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeHolderPoster"))
        
    }
    
}
