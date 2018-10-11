//
//  UIStackView+Extension.swift
//  EverythingAboutSwift
//
//  Created by Squall on 10/5/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView{
    func changeStackViewColor(color:UIColor){
        let backgroundLayer = CAShapeLayer()
        self.layer.insertSublayer(backgroundLayer, at: 0)
        backgroundLayer.path = UIBezierPath(rect: self.bounds).cgPath
        backgroundLayer.fillColor = color.cgColor
    }
}
