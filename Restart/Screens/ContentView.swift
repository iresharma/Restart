//
//  ContentView.swift
//  Restart
//
//  Created by Iresh Sharma on 19/11/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboarding: Bool = true
    
    var body: some View {
        VStack {
            if(isOnboarding) {
                OnBoardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
