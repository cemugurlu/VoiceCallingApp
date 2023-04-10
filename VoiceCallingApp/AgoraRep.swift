//
//  AgoraRep.swift
//  VoiceCallingApp
//
//  Created by Cem Uğurlu on 7.04.2023.
//

import Foundation
import SwiftUI
import AgoraRtcKit

struct AgoraRep: UIViewControllerRepresentable {
    @Binding var isMuted: Bool
    
    func makeUIViewController(context: Context) -> AgoraViewController {
        let agoraViewController = AgoraViewController()
        agoraViewController.agoraDelegate = context.coordinator
        return agoraViewController
    }
    
    func updateUIViewController(_ uiViewController: AgoraViewController, context: Context) {
        isMuted ? (uiViewController.didClickMuteButton(isMuted: true)) : (uiViewController.didClickMuteButton(isMuted: false))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, AgoraRtcEngineDelegate {
        var parent: AgoraRep
        init(_ agoraRep: AgoraRep) {
            parent = agoraRep
        }
        
        // Implement the required delegate methods here
    }
}


