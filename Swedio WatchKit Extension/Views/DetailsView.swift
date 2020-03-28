//
//  DetailsView.swift
//  Swedio WatchKit Extension
//
//  Created by Emil Doychinov on 2020-03-27.
//  Copyright © 2020 Emil Doychinov. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


struct DetailsView: View {
    
    var radioItem: RadioItem

    @State private var isPlaying = false
    @ObservedObject var avPlayer = StreamingPlayer()
    
    var body: some View {
        VStack {
            Text(radioItem.name)
            Button(action: {
                self.playPause()
                self.isPlaying.toggle()
            }) {
                if isPlaying {
                    Image(systemName: "pause")
                        .font(Font.system(.largeTitle))
                    
                } else {
                    Image(systemName: "play")
                        .font(Font.system(.largeTitle))
                    
                }
            }
        }
        .background(VolumeView().opacity(0))
        .onDisappear {
            self.avPlayer.stop()
        }
    }
    
    private func playPause() {
        avPlayer.play(stringUrl: radioItem.url)
    }
}

class ObservedVolume: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ObservedVolume,Never>()

    var myInteger = 1 {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func increaseInteger() {
        myInteger += 1
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(radioItem: RadioItem(id: "", name: "Bandit", url: ""))
    }
}
