//
//  UIImage+Extension.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 20.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import UIKit

extension UIImage {

    class func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "01d", "02d" :
            return UIImage.imageForIcon(withName: "Clear")
        case "03d", "04d" : return UIImage.imageForIcon(withName: "Cloudy")
        case "09d", "10d": return UIImage.imageForIcon(withName: "Rain")
        case "13d": return UIImage.imageForIcon(withName: "Snow")
        default:
            return UIImage.imageForIcon(withName: "Clear")

        }

    }
}
