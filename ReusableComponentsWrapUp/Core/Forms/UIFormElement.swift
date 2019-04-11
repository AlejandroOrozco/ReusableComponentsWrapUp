//
//  UIFormElement.swift
//  ReusableComponentsWrapUp
//
//  Created by Alejandro Orozco Builes on 4/9/19.
//  Copyright © 2019 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

protocol UIFormEnum: RawRepresentable where RawValue == UIFormElement {}

protocol UIFormElement {
    var validated: Bool { get }
    init(name: String, placeholder: String?, value: String?, validates: Bool)
    func loadViewFromNib() -> UIView
}
