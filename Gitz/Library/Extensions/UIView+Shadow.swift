//
//  UIView+Shadow.swift
//  Lerosa
//
//  Created by usuario on 16/10/2018.
//  Copyright © 2018 Cedro Technologies. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow(color: UIColor = .black, opacity: Float = 0.5, offSet: CGSize = CGSize(width: 3, height: 3), radius: CGFloat = 0.0) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
}
