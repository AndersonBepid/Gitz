//
//  UITableView+.swift
//  FastTrade
//
//  Created by cedro_nds on 03/07/2018.
//  Copyright © 2018 Cedro Technologies. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {

    // MARK: Empty TableView

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font.withSize(16.0)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
    }

    func restore() {
        self.backgroundView = nil
    }
}
