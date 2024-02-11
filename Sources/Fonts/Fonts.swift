//
//  Fonts.swift
//  Bikers-App
//
//  Created by Mohamed Alsheikh on 21/06/2023.
//  Copyright © 2023 Amr. All rights reserved.
//

import Foundation
import UIKit

enum Fonts: String {
    
    case H1
    case H2
    case H3
    case H4
    case H5
    case H5Bold
    case B1
    case Inputs
    case Buttons
    
    var font: UIFont? {
        switch self {
        case .H1:
            return UIFont(name: Style.SFProDisplaySemibold.value, size: 32)
        case .H2:
            return UIFont(name: Style.SFProDisplaySemibold.value, size: 24)
        case .H3:
            return UIFont(name: Style.SFProDisplaySemibold.value, size: 20)
        case .H4:
            return UIFont(name: Style.SFProDisplayMedium.value, size: 14)
        case .H5:
            return UIFont(name: Style.SFProDisplayMedium.value, size: 12)
        case .H5Bold:
            return UIFont(name: Style.SFProDisplayBold.value, size: 12)
        case .B1:
            return UIFont(name: Style.SFProDisplaySemibold.value, size: 16)
        case .Inputs:
            return UIFont(name: Style.SFProDisplaySemibold.value, size: 16)
        case .Buttons:
            return UIFont(name: Style.SFProDisplaySemibold.value, size: 18)
        }
    }
}


public enum Style: CaseIterable {
    case SFProDisplayBold
    case SFProDisplaySemibold
    case SFProDisplayMedium
    case SFProDisplayRegular
    public var value: String {
        switch self {
        case .SFProDisplayBold: return "SFProDisplay-Bold"
        case .SFProDisplaySemibold: return "SFProDisplay-Semibold"
        case .SFProDisplayMedium: return "SFProDisplay-Medium"
        case .SFProDisplayRegular: return "SFProDisplay-Regular"
        }
    }
}
