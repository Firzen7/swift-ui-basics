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
    
    let rotationAngle: CGFloat = 360.0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            LinearGradient(colors: screenTapped ? colours : colours2,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            
            Text(screenTapped ? "SwiftUI Basics" : "To be or not to be? To be or not to be? To be or not to be? To be or not to be? To be or not to be? To be or not to be?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .rotation3DEffect(.degrees(screenTapped ? .zero : rotationAngle),
                                  axis: (x: 0, y: 1, z: 0))
        }
        .onTapGesture {
            
            withAnimation(.easeIn(duration: 0.5)) {
                // changes screen background on tap
                screenTapped.toggle()
            }
            
//            withAnimation(.easeIn(duration: 0.3)) {
//                offset = CGFloat.random(in: -150...150)
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
