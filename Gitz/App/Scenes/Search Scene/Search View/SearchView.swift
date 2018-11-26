//
//  SearchView.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import UIKit

class SearchView: UIView {

    // MARK: IBOutlets

    @IBOutlet weak var searchTextField: UITextField!

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        searchTextField.delegate = self
    }
}

// MARK: IBActions

extension SearchView { }

// MARK: Text Field Delegate

extension SearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text
        NotificationCenter.default.post(name: RepositoryViewController.notificationName, object: text)
        textField.resignFirstResponder()
        return true
    }
}
