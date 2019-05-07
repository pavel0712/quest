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

class PlayerViewController: UIViewController {

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
            print("playVideoFile true")
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            let playerController = AVPlayerViewController()
            playerController.player = player
            playerController.showsPlaybackControls = false
            present(playerController, animated: true) {
                player.play()
            }
        }
    }

    @IBAction func checkCode(_ sender: Any) {
        guard let input = self.codeField.text else {
            return
        }
        guard let place = DBManager.sharedInstance.selectedPlace else {
            return
        }


        if place.code.isEqual(to:input) {
            performSegue(withIdentifier: "showMap", sender: nil)
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
