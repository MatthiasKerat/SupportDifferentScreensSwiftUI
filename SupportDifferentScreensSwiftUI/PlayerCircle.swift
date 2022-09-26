//
//  PlayerCircle.swift
//  SupportDifferentScreensSwiftUI
//
//  Created by Matthias Kerat on 26.09.22.
//

import SwiftUI

struct PlayerCircle: View {
    let backgroundColor: Color
    let playerName: String
    let circleDimens: CGFloat
    let fontSize: CGFloat
    var body: some View {
        ZStack{
            Circle()
                .fill(backgroundColor)
                .frame(width: circleDimens, height: circleDimens, alignment: .center)
                .shadow(color: Color("backgroundSecondary"), radius: 5)
            Text(playerName)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(width: circleDimens-10, height: circleDimens-10, alignment: .center)
                .multilineTextAlignment(.center)
        }
    }
}
