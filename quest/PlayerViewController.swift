//
//  PlayerViewController.swift
//  quest
//
//  Created by Pavel Oleinic on 5/3/19.
//  Copyright © 2019 Pavel Oleinic. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerViewController: UIViewController, UITextFieldDelegate, AVPlayerViewControllerDelegate {

    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var missionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        missionLabel.text = DBManager.sharedInstance.selectedPlace?.mission
    }

    @IBAction func playVideoFile(_ sender: Any) {
        guard let place = DBManager.sharedInstance.selectedPlace else {
            return
        }
        print(place.placeID)
        if let path = Bundle.main.path(forResource: place.placeID as String, ofType:"mp4") {
            let player = AVPlayer(url: URL(fileURLWithPath: path))

            let playerController = AVPlayerViewController()
            playerController.player = player
            playerController.showsPlaybackControls = false
            present(playerController, animated: true) {
                player.play()
            }
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(playerDidFinishPlaying),
                                                   name: .AVPlayerItemDidPlayToEndTime,
                                                   object: player.currentItem)
        }
    }

    @IBAction func checkCode(_ sender: Any) {
        guard let input = self.codeField.text else {
            return
        }
        guard let place = DBManager.sharedInstance.selectedPlace else {
            return
        }

        if place.code.contains(input) {
            performSegue(withIdentifier: "showMap", sender: nil)
        } else {
            wrongCode()
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

    func wrongCode() {
        let alert = UIAlertController.init(title: "Too Bad ;(",
                                           message: "Incearca inca odata!",
                                           preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }

    @objc func playerDidFinishPlaying(note: NSNotification) {
        dismiss(animated: true)
    }
}
