//
//  SoundsBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 21/11/2022.
//

import SwiftUI
import AVKit
class SoundManager{
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    func playSound() {
        guard let url = Bundle.main.url(forResource: "Tada-sound", withExtension: ".mp3") else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error playing sound \(error.localizedDescription)")
        }
    }
}
struct SoundsBootcamp: View {
    var soundManager = SoundManager()
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.instance.playSound()
            }
            Button("Play sound 2") {
                
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
