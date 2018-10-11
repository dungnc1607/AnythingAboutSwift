//
//  UIImageView+Extensions.swift
//  BasicCollectionView
//
//  Created by Squall on 10/8/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView{
    public func getImageFromURL(urlString:String){
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL , completionHandler: { (data, URL, error) in
            if error != nil{
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
