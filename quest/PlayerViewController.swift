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
        guard let place = DBManager.sharedInstance.selectedPlace else {
            return
        }
        missionLabel.text = place.mission as String
        // Do any additional setup after loading the view.
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
//            playerController.showsPlaybackControls = false
            present(playerController, animated: true) {
                player.play()
            }
//            NotificationCenter.default.addObserver(self,
//                                                   selector: Selector(("playerDidFinishPlaying:")),
//                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
//                                                   object: player.currentItem)
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
        let alert = UIAlertController.init(title: "Too Bad",
                                           message: "Inchearca inca odata!",
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

    public func playerDidFinishPlaying(note: NSNotification) {
        print("playerDidFinishPlaying 1")
        print(note.userInfo)
        print("playerDidFinishPlaying 2")
//        self.navigationController?.popViewController(animated: true)
        print("playerDidFinishPlaying 3")
    }
}
