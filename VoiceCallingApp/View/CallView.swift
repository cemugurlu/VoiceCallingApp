//
//  CallView.swift
//  VoiceCallingApp
//
//  Created by Cem Uğurlu on 7.04.2023.
//

import SwiftUI
import AVFoundation

struct CallView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isMuted: Bool = true
    
    var body: some View {
        VStack {
            Text("Welcome to the call!")
                .bold()
            
            Spacer()
            
            AgoraRep(isMuted: $isMuted)
                .frame(width: 0, height: 0, alignment: .center)
            
            HStack {
                Image(systemName: "mic.circle.fill")
                    .font(.system(size: 64.0))
                    .foregroundColor(isMuted ? Color.yellow : Color.blue)

                    .padding()
                    .onTapGesture {
                              isMuted ? (isMuted = false) : (isMuted = true)
                          }
                
                Spacer()
                
                Image(systemName: "phone.circle.fill")
                    .font(.system(size:64.0))
                    .foregroundColor(.red)
                    .padding()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            .padding()
        }
        .onAppear {
            requestMicrophonePermission()
        }
    }
    
    func requestMicrophonePermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { [self] granted in
            if granted {
                print("Microphone permission granted")
            } else {
                print("Microphone permission denied")
            }
        }
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
    }
}
