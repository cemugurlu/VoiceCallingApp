//
//  AgoraViewController.swift
//  VoiceCallingApp
//
//  Created by Cem Uğurlu on 7.04.2023.
//

import Foundation
import AgoraRtcKit

class AgoraViewController: UIViewController {
    var agoraKit: AgoraRtcEngineKit?
    var agoraDelegate: AgoraRtcEngineDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAgoraEngine()
        joinChannel()
    }
    
    func initializeAgoraEngine() {
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "8dd5a5021e9f4fd8a175e10d788dafba", delegate: agoraDelegate)
    }
    
    func joinChannel() {
        agoraKit?.joinChannel(byToken: "007eJxTYHB18glvsJlx5FJ22cMKG56Ju9uivnzcw/dx5utJ5Q77dxUoMFikpJgmmhoYGaZappmkpVgkGpqbphoapJhbWKQkpiUl7pc0SGkIZGTQPt3KxMgAgSC+AENIanGJgnNGYl5eao6Cc2ouAwMAY/ck/Q==", channelId: "TestChannel", info: nil, uid: 0, joinSuccess: {(channel, uid, elapsed) in})
    }
    
    func leaveChannel() {
           agoraKit?.leaveChannel(nil)
       }
    
    func destroyInstance() {
           AgoraRtcEngineKit.destroy()
       }
    
    func didClickMuteButton(isMuted: Bool) {
        isMuted ? (agoraKit?.muteLocalAudioStream(true)) : (agoraKit?.muteLocalAudioStream(false))
      }
    
    override func viewWillDisappear(_ animated: Bool) {
           leaveChannel()
           destroyInstance()
       }

}
