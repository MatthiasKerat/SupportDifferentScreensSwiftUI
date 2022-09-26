//
//  ContentView.swift
//  SupportDifferentScreensSwiftUI
//
//  Created by Matthias Kerat on 25.09.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WelcomeViewModel()
    let layoutProperties:LayoutProperties
    let playerTextFieldColor = Color("dark_green")
    let playerColors = [Color("blue"),Color("orange"),Color("purple"),Color("green")]
    var gridItems:[GridItem]{
        if(layoutProperties.width > 700 || layoutProperties.landscape){
            return [
                GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())
            ]
        }else{
            return [
                GridItem(.flexible()), GridItem(.flexible())
            ]
        }
    }
    var body: some View {
        WelcomeRootView(isLandscape: layoutProperties.landscape) {
            Image(layoutProperties.landscape ? "welcome_picture_landscape" : "welcome_picture_portrait")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(layoutProperties.dimensValues.medium)
                .shadow(radius: layoutProperties.dimensValues.medium)
            VStack{
                HStack{
                    TextField("Add new Player", text: $viewModel.playerTextFieldInput)
                        .padding(layoutProperties.dimensValues.medium)
                        .overlay(
                            RoundedRectangle(cornerRadius: layoutProperties.dimensValues.mediumLarge)
                                .stroke(playerTextFieldColor, lineWidth: 1)
                        )
                        .font(.system(size: layoutProperties.customFontSize.medium))
                        .submitLabel(.done)
                    
                    if !viewModel.playerTextFieldInput.isEmpty{
                        Button {
                            withAnimation {
                                viewModel.addPlayer(
                                    color: playerColors[viewModel.currentPlayers.count % playerColors.count]
                                )
                            }
                        } label: {
                            Image(systemName: "person.fill.checkmark")
                                .foregroundColor(playerTextFieldColor)
                                .font(.system(size: layoutProperties.customFontSize.large))
                        }
                        .padding(layoutProperties.dimensValues.small)

                    }
                }
                .padding(layoutProperties.dimensValues.large)
                LazyVGrid(
                    columns: gridItems,
                    spacing: gridItems.count < 4 ? layoutProperties.dimensValues.large*2 : layoutProperties.dimensValues.large
                ){
                    ForEach(viewModel.currentPlayers, id: \.name){player in
                        PlayerCircle(
                            backgroundColor: player.color,
                            playerName: player.name,
                            circleDimens: layoutProperties.dimensValues.large * 6,
                            fontSize: layoutProperties.customFontSize.medium)
                    }
                }
                Spacer()
                Button {
                    //
                } label: {
                    Text("Start game")
                        .font(.system(size: layoutProperties.customFontSize.medium))
                        .fontWeight(.bold)
                        .padding(layoutProperties.dimensValues.mediumLarge)
                        .frame(maxWidth: .infinity)
                }
                .background(Color("dark_green"))
                .foregroundColor(.white)
                .cornerRadius(layoutProperties.dimensValues.extraLarge)
                .padding(layoutProperties.dimensValues.medium)
            }
            .padding(.bottom, layoutProperties.dimensValues.small)
        }.ignoresSafeArea(.all)
    }
}

struct WelcomeRootView<Content:View>:View{
    let isLandscape:Bool
    @ViewBuilder var content:()->Content
    var body: some View{
        
        if(isLandscape){
            HStack{
                content()
            }
        }else{
            VStack{
                content()
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView(
                layoutProperties: getPreviewLayoutProperties(landscape: false, height: 844, width: 390)
            )
            .previewDevice("iPhone")
            
            ContentView(
                layoutProperties: getPreviewLayoutProperties(landscape: false, height: 1194, width: 834)
            )
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
            ContentView(
                layoutProperties: getPreviewLayoutProperties(landscape: true, height: 844, width: 390)
            )
            .previewDevice("iPhone")
            
            ContentView(
                layoutProperties: getPreviewLayoutProperties(landscape: true, height: 1194, width: 834)
            )
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
        }
        
    }
}
