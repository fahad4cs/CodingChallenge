//
//  Player.swift
//  CodingChallenge
//
//  Created by Apple on 24/11/2023.
//

import UIKit
import AVKit

class Player: UIViewController {

    private var playerViewController: AVPlayerViewController!

    init(videoURL: URL) {
        super.init(nibName: nil, bundle: nil)
        setupPlayer(videoURL: videoURL)
        setupCloseButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupPlayer(videoURL: URL) {
        let player = AVPlayer(url: videoURL)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player

        addChild(playerViewController)
        view.addSubview(playerViewController.view)

        // Adjust the frame of the player view
        playerViewController.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2)

        playerViewController.didMove(toParent: self)

        // Play the video automatically
        player.play()
    }

    private func setupCloseButton() {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

        view.addSubview(closeButton)

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }

    @objc private func closeButtonTapped() {
        playerViewController.player?.pause()
        playerViewController.willMove(toParent: nil)
        playerViewController.view.removeFromSuperview()
        playerViewController.removeFromParent()
        dismiss(animated: true, completion: nil)
    }
}


//import youtube_ios_player_helper
//class YouTubePlayerViewController: UIViewController {
//
//    private var playerView: YTPlayerView!
//
//    init(videoID: String) {
//        super.init(nibName: nil, bundle: nil)
//        setupPlayer(videoID: videoID)
//        setupCloseButton()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    private func setupPlayer(videoID: String) {
//        playerView = YTPlayerView()
//        view.addSubview(playerView)
//
//        // Set player view constraints as needed
//        playerView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            playerView.topAnchor.constraint(equalTo: view.topAnchor),
//            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//
//        // Load and play the YouTube video
//        playerView.load(withVideoId: videoID)
//        playerView.playVideo()
//    }
//
//    private func setupCloseButton() {
//        let closeButton = UIButton(type: .system)
//        closeButton.setTitle("Close", for: .normal)
//        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
//
//        view.addSubview(closeButton)
//
//        closeButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
//        ])
//    }
//
//    @objc private func closeButtonTapped() {
//        playerView.stopVideo()
//        dismiss(animated: true, completion: nil)
//    }
//}
