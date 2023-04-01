//
//  HomeView.swift
//  Onboarding Screen
//
//  Created by Md Abir Hossain on 25/3/23.
//

import SwiftUI

struct HomeView: View {
        // MARK: - Property
    
    @AppStorage("onBoarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating = false
    
        // MARK: - BODY
    
    var body: some View {
        // MARK: - Header
        
        VStack(spacing: 20) {
            
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeOut(duration: 4).repeatForever(), value: isAnimating)
            }
            
                // MARK: - Center
            
            Text("The time that leads to mastery is dependent  on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .padding()
            
                // MARK: - Footer
            
            Spacer()
            
            Button(action: {
                    // Some action
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
