//
//  TransitionsExt.swift
//  Onboarding Screen
//
//  Created by H. Yousaf on 03/07/2023.
//

import SwiftUI

extension AnyTransition {
    static var fadeIn: AnyTransition {
        AnyTransition.opacity.animation(.easeIn(duration: 0.3))
    }
}

