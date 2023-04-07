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
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let agoraViewController = AgoraViewController()
        agoraViewController.agoraDelegate = context.coordinator
        return agoraViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        isMuted ? (uiViewController.didClickMuteButton(isMuted: true)) : (uiViewController.didClickMuteButton(isMuted: false))
    }
    
    class Coordinator: NSObject, AgoraRtcEngineDelegate {
        var parent: AgoraRep
        init(_ agoraRep: AgoraRep) {
            parent = agoraRep
        }
    }
}


