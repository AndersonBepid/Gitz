//
//  SearchConfigurator.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright (c) 2018 Anderson Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension SearchInteractor: SearchViewControllerOutput, SearchRouterDataSource, SearchRouterDataDestination {
}

extension SearchPresenter: SearchInteractorOutput {
}

class SearchConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = SearchConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: SearchViewController) {
        
        let presenter = SearchPresenter()
        presenter.output = viewController
        
        let interactor = SearchInteractor()
        interactor.output = presenter
        
        let router = SearchRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}