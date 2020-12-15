//
//  Extensions.swift
//  Slot Machine
//
//  Created by Jaime Uribe on 11/12/20.
//

import SwiftUI


extension Text{
    
    func scoreLabelStyle() -> Text{
        self
            .foregroundColor(.white)
            .font(.system(size: 10.0, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text{
        self
            .foregroundColor(.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
    }
}
