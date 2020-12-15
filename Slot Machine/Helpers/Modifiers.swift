//
//  Modifiers.swift
//  Slot Machine
//
//  Created by Jaime Uribe on 11/12/20.
//

import SwiftUI

struct ShowModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0.0, y: 6.0)
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .accentColor(.white)
    }
}

struct SocoreNumberModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("ColorTransparentBlack"), radius: 0.0, x: 0.0, y: 3.0)
            .layoutPriority(1)
    }
}

struct ScoreConteinerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .frame(minWidth: 128)
            .background(
                Capsule()
                    .foregroundColor(Color("ColorTransparentBlack"))
            )
    }
}

struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 140, idealWidth: 200, maxWidth: 220, minHeight: 130, idealHeight: 190, maxHeight: 200, alignment: .center)
            .modifier(ShowModifier())
    }
}

struct BetNumberModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .rounded))
            .padding(.vertical, 5)
            .frame(width: 90)
            .shadow(color: Color("ColorTransparentBlack"), radius: 0.0, x: 0.0, y: 3.0)
    }
}

struct BetCapsuleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Capsule()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom))
            )
            .padding(3)
            .background(
                Capsule()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .bottom, endPoint: .top))
                    .modifier(BetNumberModifier())
        )
    }
}

struct CasinoChipsMofifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 64)
            .animation(.default)
            .modifier(ShowModifier())
    }
}
