//
//  Image.swift
//  videoCIFilters
//
//  Created by Julia Rocha on 27/09/18.
//  Copyright © 2018 Julia Rocha. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

class Image:UIImageView {
    
    init() {
        super.init(frame: CGRect(x: 0, y: 65, width: 400, height: 400))
        self.backgroundColor = UIColor.init(hex: 0xBFCDE0)
        self.image = UIImage(named: "rio")
        self.clipsToBounds = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var reset:Void {
        self.image = UIImage(named: "rio")
    }
}
