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
    }
}

struct rings_Previews: PreviewProvider {
    static var previews: some View {
        rings(ringColor: .gray, opacity: 0.2)
    }
}
