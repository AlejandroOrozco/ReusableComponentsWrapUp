//
//  PrimaryButton.swift
//  ReusableComponentsWrapUp
//
//  Created by Alejandro Orozco Builes on 4/9/19.
//  Copyright © 2019 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

class MyApplicationButton: DesignableButton {

    var _type: Type = .primary

    @IBInspectable
    var customType: Int = Type.primary.rawValue {
        didSet{
            _type = Type(rawValue: customType) ?? .primary
            setup()
        }
    }

    enum `Type`: Int {
        case primary, secondary ,ternary

        var bgColor: UIColor? {
            switch self {
            case .primary:
                return #colorLiteral(red: 0.09019607843, green: 0.6274509804, blue: 0.5254901961, alpha: 1)
            case.secondary:
                return #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
            case .ternary:
                return #colorLiteral(red: 0.9411764706, green: 0.368627451, blue: 0.137254902, alpha: 1)
            }
        }

        var fontColor: UIColor? {
            return .white
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    private func setup(){
        backgroundColor = _type.bgColor
        setTitleColor(_type.fontColor, for: .normal)
        cornerRadius = frame.height/2
    }

}
