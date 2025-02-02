
import SwiftUI
import AVFoundation
import UIKit
import UserNotifications

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
                   Image(systemName: "speaker.wave.3.fill")
                       .imageScale(.large)
                       .foregroundStyle(.tint)
                   Text("Playing Sound!")
               }
        .padding()
        .onAppear {
                    setupAudio()
                    startTimer()
                }
    }
    
    func setupAudio() {
        if let soundURL = Bundle.main.url(forResource: "alarm", withExtension: "wav") {
            print("Sound file found at: \(soundURL)")
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found!")
        }
            
        }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
               audioPlayer?.play()
           }
       }
}

#Preview {
    ContentView()
}
