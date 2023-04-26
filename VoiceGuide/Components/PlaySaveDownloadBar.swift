//
//  PlaySaveDownloadBar.swift
//  VoiceGuide
//
//  Created by Swee Kwang Chua on 26/4/23.
//

import SwiftUI
import SwiftRUI

struct PlaySaveDownloadBar: View {
    
    @Binding var isPlaying: Bool
    let playAction: () -> Void
    
    var body: some View {
        HStack {
            Button(isPlaying ? "Stop Audio" : "Play Audio") {
                playAction()
            }
            .buttonStyle(
                RUIRoundedCornerIconButtonStyle(
                    textColor: .black,
                    leadingIcon: {
                        Image(systemName: isPlaying ? "pause" : "play.fill")
                            .foregroundColor(.black)
                    },
                    backgroundColor: .yellow.opacity(0.3),
                    borderColor: .clear,
                    cornerRadius: 50
                )
            )
            .frame(width: 180)
            
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "bookmark")
                    .foregroundColor(.black)
            }
            .padding(.trailing,18)
            
            Button {
                
            } label: {
                Image(systemName: "tray.and.arrow.down")
                    .foregroundColor(.black)
            }
            .padding(.trailing)
            

        }
    }
}

struct PlaySaveDownloadBar_Previews: PreviewProvider {
    static var previews: some View {
        PlaySaveDownloadBar( isPlaying: .constant(false), playAction: {})
    }
}
