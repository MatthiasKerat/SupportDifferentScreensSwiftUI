//
//  WelcomeViewModel.swift
//  SupportDifferentScreensSwiftUI
//
//  Created by Matthias Kerat on 26.09.22.
//

import Foundation
import SwiftUI

class WelcomeViewModel:ObservableObject{
    
    @Published var playerTextFieldInput = ""
    
    @Published var currentPlayers:[PlayerUiItem] = [
        PlayerUiItem(name: "Lucas", color: Color("blue")),
        PlayerUiItem(name: "Matthias", color: Color("purple")),
        PlayerUiItem(name: "Nicole", color: Color("orange")),
    ]
    
    func addPlayer(color:Color) {
        currentPlayers.append(PlayerUiItem(name: playerTextFieldInput, color: color))
        playerTextFieldInput = ""
    }
    
}

struct PlayerUiItem:Hashable {
    let name:String
    let color:Color
}
