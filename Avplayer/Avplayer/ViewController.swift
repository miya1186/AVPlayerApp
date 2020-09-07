//
//  ViewController.swift
//  Avplayer
//
//  Created by miyazawaryohei on 2020/09/04.
//  Copyright © 2020 miya. All rights reserved.
//

//white-lilies

import UIKit
import MediaPlayer
import AVFoundation
import AVKit

class ViewController: UIViewController {
    //動画を再生するためのViewController
    var playerController = AVPlayerViewController()
    
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
               let audioSession = AVAudioSession.sharedInstance()
               do {
                   try audioSession.setCategory(.playback, mode: .moviePlayback)

               } catch {
                   print("")
               }

               do {
                   try audioSession.setActive(true)
                   print("active")
               } catch {

               }
    }
        
        private func playMovie(fileName: String, fileExtension: String) {
               guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
                   print("Url is nil")
                   return
               }
               // AVPlayerにアイテムをセット
               let item = AVPlayerItem(url: url)
               player.replaceCurrentItem(with: item)

               // 動画プレイヤーにplayerをセット
               playerController.player = player

               // 動画プレイヤーを表示して再生
               self.present(playerController, animated: true) {
                   self.player.play()
               }
            
           }
        
    @IBAction func aaa(_ sender: Any) {
        
        let fileName = "aa"
        let fileExtension = "mp4"
        playMovie(fileName: fileName, fileExtension: fileExtension)
    }

}

