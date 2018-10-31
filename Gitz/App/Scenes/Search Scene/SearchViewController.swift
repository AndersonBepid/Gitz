//
//  SearchViewController.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright (c) 2018 Anderson Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit
import SnapKit

protocol SearchViewControllerInput {
    
}

protocol SearchViewControllerOutput {
    
}

class SearchViewController: UIViewController, SearchViewControllerInput {

    // MARK: IBOutlets

    
    // MARK: Properties

    var output: SearchViewControllerOutput?
    var router: SearchRouter?
    var searchView: SearchView!
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SearchConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Requests
    
    
    // MARK: Display logic
    
}

// MARK: IBActions

extension SearchViewController {
    
    @IBAction func swipeDismissKeyboard(_ sender: UISwipeGestureRecognizer) {
        searchView.endEditing(true)
    }
}

// MARK: Setup Style

extension SearchViewController {

    private func setupStyle() {
       setupSearchBar()
    }

    private func setupSearchBar() {
        let bundle = Bundle.main
        let nib = bundle.loadNibNamed("SearchView", owner: nil, options: nil)?.first
        guard let searchNib = nib as? SearchView, let navBar = navigationController?.navigationBar else {
            return
        }
        searchView = searchNib
        navBar.insertSubview(searchView, at: navBar.subviews.endIndex)
        searchView.snp.makeConstraints { (make) in
            make.leadingMargin.equalTo(navBar).offset(16)
            make.trailingMargin.equalTo(navBar).offset(-16)
            make.topMargin.equalTo(navBar).offset(8)
            make.bottomMargin.equalTo(navBar).offset(-8)
        }
    }
}

//This should be on configurator but for some reason storyboard doesn't detect ViewController's name if placed there
extension SearchViewController: SearchPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}
