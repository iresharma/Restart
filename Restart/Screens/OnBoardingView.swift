//
//  OnBoardingView.swift
//  Restart
//
//  Created by Iresh Sharma on 19/11/21.
//

import SwiftUI

struct OnBoardingView: View {
    //    MARK: Property
    
    @AppStorage("onboarding") var isOnboarding: Bool = true
    
//    MARK: Slide Animation Variable
    private var buttonWidth: Double = UIScreen.main.bounds.width - 80.0
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    
    
    //    MARK: Body
    var body: some View {
        return ZStack {
            Color("ColorBlue")
            VStack(spacing: 20) {
                Spacer()
                Header
                Center
                Footer
                Spacer()
            }
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            isAnimating = true
        })
    }
    
    var Header: some View {
        //                MARK: Header
        
        VStack(spacing: 0) {
            Text("Share")
                .font(.system(size: 60))
                .fontWeight(.heavy)
                .foregroundColor(.white)
            Text("""
                                It's not how much we give,
                                But how love we put in !
                                """)
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeInOut(duration: 1), value: isAnimating)
        
    }
    
    var Center: some View {
        //                MARK: Center
        ZStack {
            ZStack {
                rings(ringColor: .white, opacity: 0.2)
            }
            Image("character-1")
                .resizable()
                .scaledToFit()
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 1.5), value: isAnimating)
        }
    }
    
    var Footer: some View {
        
        //                MARK: Footer
        ZStack {
            //                    MARK: Static back
            Capsule()
                .fill(.white.opacity(0.2))
            Capsule()
                .fill(.white.opacity(0.2))
                .padding()
            
            Text("Get Started")
                .font(.title2)
                .fontWeight(.bold)
                .offset(x: 20)
            
            HStack {
                Capsule()
                    .fill(.red)
                    .frame(width: buttonOffset + 80.0)
                Spacer()
            }
            
            HStack {
                ZStack {
                    Capsule()
                        .fill(Color("ColorRed"))
                    Circle()
                        .fill(.black.opacity(0.15))
                        .padding()
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 20, weight: .bold))
                }
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .offset(x: buttonOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ gesture in
                            if gesture.translation.width > 0 && buttonOffset <= (buttonWidth - 60) {
                                buttonOffset = gesture.translation.width
                            }
                            
                        })
                        .onEnded({ gesture in
                            withAnimation(Animation.easeOut(duration: 0.8)) {
                                if buttonOffset < (buttonWidth - 80) / 2  {
                                    buttonOffset = 0.0
                                }
                                else {
                                    buttonOffset = buttonWidth - 60
                                    isOnboarding = false
                                }
                            }
                        })
                )
                Spacer()
            }
        }
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
        .offset(y: isAnimating ? 0 : 60)
        .opacity(isAnimating ? 1 : 0)
        .animation(.easeOut(duration: 1), value: isAnimating)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
