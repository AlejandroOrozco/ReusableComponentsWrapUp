//
//  MyAppTextField.swift
//  ComponentsDesign
//
//  Created by Alejandro Orozco Builes on 3/27/19.
//  Copyright © 2019 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

class MyAppTextField: DesignableView, UIFormElement {
  var validated: Bool = false

  required convenience init(name: String, placeholder: String?, value: String?, validates: Bool) {
    self.init()
    self.name = name
    if let placeholder = placeholder {
      self.placeholder = placeholder
    }
    if let value = value {
      self.text = value
    }
  }


  @IBOutlet var view: UIView!
  @IBOutlet weak var textFieldName: UILabel!
  @IBOutlet weak var textField: UITextField!

  @IBInspectable
  var name: String = String() {
    didSet { configureTextField() }
  }

  @IBInspectable
  var text: String = String() {
    didSet { configureTextField() }
  }

  @IBInspectable
  var placeholder: String = String() {
    didSet { configureTextField() }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  private func setup(){
    view = loadViewFromNib()
    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(view)
  }

  private func configureTextField(){
    textFieldName.text = name
    textField.text = text
    textField.placeholder = placeholder
  }

  func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    configureTextField()
    return view
  }
}
