//
//  ContentView.swift
//  swift-ui-basics
//
//  Created by Ondrej on 04.01.2023.
//

import SwiftUI

struct ContentView: View {
    private let colours: [Color] = [.blue, .green, .purple]
    private let colours2: [Color] = [.purple, .green, .blue]

    @State private var screenTapped: Bool = false
    @State private var offset: CGFloat = -300.0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            LinearGradient(colors: screenTapped ? colours : colours2,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            
            Text("SwiftUI Basics")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .offset(y: offset)
        }
        .onTapGesture {
            // changes screen background on tap
            screenTapped.toggle()
            
            withAnimation(.easeIn(duration: 0.3)) {
                offset = CGFloat.random(in: 0...300)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
