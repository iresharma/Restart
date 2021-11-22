//
//  rings.swift
//  Restart
//
//  Created by Iresh Sharma on 19/11/21.
//

import SwiftUI

struct rings: View {
    
    @State var ringColor: Color
    @State var opacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .stroke(ringColor.opacity(opacity), lineWidth: 40)
                    .frame(width: 260, height: 260, alignment: .center)
                
                Circle()
                    .stroke(ringColor.opacity(opacity), lineWidth: 80)
                    .frame(width: 260, height: 260, alignment: .center)
            }
        }
        .blur(radius: isAnimating ? 1 : 10)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 2), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct rings_Previews: PreviewProvider {
    static var previews: some View {
        rings(ringColor: .gray, opacity: 0.2)
    }
}
