//
//  StreamingPlayer.swift
//  WatchSync WatchKit Extension
//
//  Created by Emil Doychinov on 2020-03-27.
//  Copyright © 2020 Emil Doychinov. All rights reserved.
//

import Foundation
import AVFoundation
import Combine

class StreamingPlayer: ObservableObject {
    
    @Published var status: AVPlayer.TimeControlStatus = .waitingToPlayAtSpecifiedRate
    
    private let session = AVAudioSession.sharedInstance()
    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    
    func play(stringUrl: String) {
        print(stringUrl)
        guard let url = URL(string: stringUrl) else {
            stop()
            return
        }
        
        if player == nil {
            configureAudioSession()
        }

        playerItem = AVPlayerItem(url: url)
    
        session.activate(options: []) { [weak self] (success, error) in
            
            guard error == nil else {
                print("*** An error occurred: \(error!.localizedDescription) ***")
                //completion?(false)
                return
            }
            
            if success {
                if self?.audioStreamIsPlaying ?? false {
                    print("pause")
                    self?.stop()
                } else {
                    print("play")
                    self?.player = AVPlayer(playerItem: self?.playerItem)
                    self?.player?.play()
                }
            }
        }
}

    func stop() {
        self.player?.pause()
        self.player = nil
    }
    
    private var audioStreamIsPlaying: Bool {
        
        if let audioPlayer = player {
            return audioPlayer.rate > 0
        }
        
        return false
    }
    
    private func stopifPlaying() {
        do {
            try session.setActive(false, options: .notifyOthersOnDeactivation)
        } catch let error {
            fatalError("*** Unable to set up the audio session: \(error.localizedDescription) ***")
        }
    }
    
    private func configureAudioSession() {
        
        do {
            try session.setCategory(AVAudioSession.Category.playback,
                                    mode: .default,
                                    policy: .longFormAudio,
                                    options: [])
        } catch let error {
            fatalError("*** Unable to set up the audio session: \(error.localizedDescription) ***")
        }
    }
}
