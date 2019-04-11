//
//  ReusableTableViewCell.swift
//  ReusableComponentsWrapUp
//
//  Created by Alejandro Orozco Builes on 4/9/19.
//  Copyright © 2019 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

class ReusableTableViewCell: UITableViewCell {
  @IBOutlet weak var containerStackView: UIStackView!

  func configure(with element: UIFormElement) {
    cleanContainer()
    containerStackView.addArrangedSubview(element.loadViewFromNib())
  }

  private func cleanContainer() {
    containerStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
  }
}
