//
//  UIDevice+Extension.swift
//  EverythingAboutSwift
//
//  Created by Squall on 10/8/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice{ //Check device để thực hiện auto layout (vd trên ipad thì ảnh và text to hơn 1 chút)
    static func setSize(iPhone:CGFloat, iPad:CGFloat) -> CGFloat{
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return iPhone
        case .pad:
            return iPad
        default:
            return 0
        }
    }
}
