//
//  UIViewAnimationCurveExtension.swift
//  InAndOut
//
//  Created by Jason Nam on 9/20/16.
//  Copyright © 2016 Jason Nam. All rights reserved.
//

import UIKit

extension UIViewAnimationCurve {

    var options: UIViewAnimationOptions {
        return UIViewAnimationOptions(rawValue: UInt(rawValue << 16))
    }
}
