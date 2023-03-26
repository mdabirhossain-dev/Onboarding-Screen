//
//  OnboardingView.swift
//  Onboarding Screen
//
//  Created by Md Abir Hossain on 25/3/23.
//

import SwiftUI

struct OnboardingView: View {
        // MARK: - Property
    
    @AppStorage("onBoarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffSet: CGFloat = 0
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                    // MARK: - Header
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: Header
                
                    // MARK: - Center
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: Center
                
                Spacer()
                
                    // MARK: - Footer
                
                ZStack {
                    // Parts of the custom button
                    
                    // 1. Background (Static)
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. Call-to-action (Static)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .offset(x: 20)
                    
                    // 3. Capsule (Dynamic Eidth)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffSet + 80)
                        
                        Spacer()
                    }
                    
                    // 4. Circle Draggable
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffSet)
                        .gesture (
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffSet <= buttonWidth - 80 {
                                        buttonOffSet = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    if buttonOffSet > buttonWidth / 2 {
                                        buttonOffSet = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        withAnimation { buttonOffSet = 0 }
                                    }
                                }
                        ) //: DragGesture
                        
                        Spacer()
                    } //: HSTACK
                } //: Footer
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
            } // : VSTACK
        } // : ZSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
