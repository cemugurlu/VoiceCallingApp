//
//  ContentView.swift
//  VoiceCallingApp
//
//  Created by Cem Uğurlu on 6.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingCallView: Bool = false
    
    var body: some View {
        Button(action: {}) {
              Text("Join Call")
                .font(.title)
                .foregroundColor(.white)
                .padding(.all)
            }
            .background(Color.green)
            .cornerRadius(8.0)
            .fullScreenCover(isPresented: $isShowingCallView, content: {
                CallView()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
