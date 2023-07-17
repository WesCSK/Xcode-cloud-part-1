//
//  ContentView.swift
//  VoiceGuide
//
//  Created by Swee Kwang Chua on 26/4/23.
//

import SwiftUI
import SwiftRUI
import AVFoundation

struct ContentView: View {
    
    var synthesizer = AVSpeechSynthesizer()
       
       @State var isPlaying = false
    
       let text = "Singapore, officially the Republic of Singapore, is an island country and city-state in maritime Southeast Asia. It is located about one degree of latitude (137 kilometres or 85 miles) north of the equator, off the southern tip of the Malay Peninsula, bordering the Strait of Malacca to the west, the Singapore Strait to the south, the South China Sea to the east, and the Straits of Johor to the north. The country's territory is composed of one main island, 63 satellite islands and islets, and one outlying islet; the combined area of these has increased by 25% since the country's independence as a result of extensive land reclamation projects. It has the third highest population density in the world, although there are numerous green and recreational spaces as a result of urban planning. With a multicultural population and in recognition of the cultural identities of the major ethnic groups within the nation, Singapore has four official languages – English, Malay, Mandarin, and Tamil. English is the lingua franca, with its exclusive use in numerous public services. Multi-racialism is enshrined in the constitution and continues to shape national policies in education, housing, and politics."
       
       init(synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer(), isPlaying: Bool = false) {
           self.synthesizer = synthesizer
           self.isPlaying = isPlaying
           
           let audioSession = AVAudioSession.sharedInstance()
           try! audioSession.setCategory(
               AVAudioSession.Category.playback,
               options: AVAudioSession.CategoryOptions.mixWithOthers
           )
       }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("singapore")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    PlaySaveDownloadBar(isPlaying: $isPlaying) {
                        if synthesizer.isPaused {
                            // If youse pauseSpeaking
                            synthesizer.continueSpeaking()
                            isPlaying = true
                        } else if (!synthesizer.isSpeaking) {
                            
                            let utterance = AVSpeechUtterance(string: text)
                            utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.voice.compact.en-AU.Karen")
                            
                            // Change to different voice
                            print(AVSpeechSynthesisVoice.speechVoices())
                            // AVSpeechSynthesisVoice(identifier: "com.apple.voice.compact.el-GR.Melina")
                            utterance.rate = 0.5
                            isPlaying = true
                            
                            synthesizer.speak(utterance)
                        } else {
                            isPlaying = false
                            synthesizer.pauseSpeaking(at: .immediate)
                        }
                    }
                    
                    Text("About Singapore")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 26)
                        .padding(.leading, 12)
                    
                    Text(text)
                        .padding(.horizontal)
                        .padding(.top,8)
                }
                .padding()
                
                
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
