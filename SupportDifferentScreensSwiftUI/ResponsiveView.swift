//
//  ResponsiveView.swift
//  SupportDifferentScreensSwiftUI
//
//  Created by Matthias Kerat on 25.09.22.
//

import SwiftUI

struct ResponsiveView<Content:View>: View {
    var content:(LayoutProperties) -> Content
    var body: some View {
        GeometryReader{geo in
            let height = geo.size.height
            let width = geo.size.width
            let landScape = height<width
            let dimensValues = CustomDimensValues(height:height, width:width)
            let customFontSize = CustomFontSize(height:height, width:width)
            content(
                LayoutProperties(
                    landscape: landScape,
                    dimensValues: dimensValues,
                    customFontSize: customFontSize,
                    height: height,
                    width: width
                )
            )
        }
    }
}

struct CustomFontSize {
    let small:CGFloat
    let smallMedium:CGFloat
    let medium:CGFloat
    let mediumLarge:CGFloat
    let large:CGFloat
    let extraLarge:CGFloat
    init(height:CGFloat, width:CGFloat){
        let widthToCalculate = height<width ? height : width
        switch widthToCalculate {
        case _ where widthToCalculate<700:
            small = 8
            smallMedium = 11
            medium = 14
            mediumLarge = 16
            large = 18
            extraLarge = 25
        case _ where widthToCalculate>=700 && widthToCalculate<1000:
            small = 15
            smallMedium = 18
            medium = 22
            mediumLarge = 26
            large = 30
            extraLarge = 40
        case _ where widthToCalculate>=1000:
            small = 20
            smallMedium = 24
            medium = 28
            mediumLarge = 32
            large = 36
            extraLarge = 45
        default:
            small = 8
            smallMedium = 11
            medium = 14
            mediumLarge = 16
            large = 18
            extraLarge = 25
        }
    }
}

struct CustomDimensValues {
    let small:CGFloat
    let smallMedium:CGFloat
    let medium:CGFloat
    let mediumLarge:CGFloat
    let large:CGFloat
    let extraLarge:CGFloat
    init(height:CGFloat, width:CGFloat){
        let widthToCalculate = height<width ? height : width
        switch widthToCalculate{
        case _ where widthToCalculate<700:
                    small = 7
                    smallMedium = 10
                    medium = 12
                    mediumLarge = 15
                    large = 17
                    extraLarge = 22
                case _ where widthToCalculate>=700 && widthToCalculate<1000:
                    small = 14
                    smallMedium = 16
                    medium = 19
                    mediumLarge = 22
                    large = 24
                    extraLarge = 29
                case _ where widthToCalculate>=1000:
                    small = 17
                    smallMedium = 20
                    medium = 23
                    mediumLarge = 25
                    large = 28
                    extraLarge = 32
                default:
                    small = 5
                    smallMedium = 8
                    medium = 10
                    mediumLarge = 13
                    large = 15
                    extraLarge = 20
        }
    }
}

struct LayoutProperties {
    var landscape:Bool
    var dimensValues:CustomDimensValues
    var customFontSize:CustomFontSize
    var height:CGFloat
    var width:CGFloat
}

func getPreviewLayoutProperties(landscape:Bool, height: CGFloat, width: CGFloat) -> LayoutProperties{
    return LayoutProperties(
        landscape: landscape,
        dimensValues: CustomDimensValues(height: height, width: width),
        customFontSize: CustomFontSize(height: height, width: width),
        height: height,
        width: width
    )
}
