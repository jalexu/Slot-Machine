//
//  LogoView.swift
//  Slot Machine
//
//  Created by Jaime Uribe on 11/12/20.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("gfx-slot-machine")
            .resizable()
            .scaledToFit()
            .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 130, alignment: .center)
            .padding(.horizontal)
            .layoutPriority(1)
            .modifier(ShowModifier())
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
