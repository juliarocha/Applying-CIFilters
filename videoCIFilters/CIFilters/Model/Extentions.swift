//
//  Extentions.swift
//  videoCIFilters
//
//  Created by Julia Rocha on 27/09/18.
//  Copyright © 2018 Julia Rocha. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let inside = UIColor(hex: 0xEAE2CF)
    
    // Create a UIColor from RGB
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    // Create a UIColor from a hex value (E.g 0x000000)
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
}
