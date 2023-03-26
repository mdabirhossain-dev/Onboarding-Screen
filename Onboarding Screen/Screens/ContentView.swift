//
//  ContentView.swift
//  Onboarding Screen
//
//  Created by Md Abir Hossain on 25/3/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onBoarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
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
