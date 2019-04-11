//
//  UIKitExtensions.swift
//  ReusableComponentsWrapUp
//
//  Created by Alejandro Orozco Builes on 4/9/19.
//  Copyright © 2019 Alejandro Orozco Builes. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignableView: UIView {}

@IBDesignable class DesignableButton: UIButton {}

@IBDesignable class DesignableLabel: UILabel {}

@IBDesignable class DesignableTextField: UITextField {}

@IBDesignable extension UIView {

    @IBInspectable var borderColor:UIColor? {
        set { layer.borderColor = newValue!.cgColor }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else { return nil }
        }
    }

    @IBInspectable var borderWidth:CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }

    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get { return layer.cornerRadius }
    }

    @IBInspectable var shadowEffect:Float {
        set {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = newValue
            self.layer.shadowOffset = CGSize.zero
            self.layer.shadowRadius = 10
        }
        get { return self.layer.shadowOpacity }
    }

}
