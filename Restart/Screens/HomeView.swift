//
//  HomeView.swift
//  Restart
//
//  Created by Iresh Sharma on 19/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboarding: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            VStack {
                ZStack {
                    rings(ringColor: .gray, opacity: 0.1)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 320)
                Text("""
The time that leads to mastery is
dependent on the intensity of our focus
""")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .padding()
            }
            Spacer()
            Button(action: {
                isOnboarding = true
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart")
                    .font(.caption)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.mini)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
