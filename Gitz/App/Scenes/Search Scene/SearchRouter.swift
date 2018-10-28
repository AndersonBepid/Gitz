//
//  SearchRouter.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright (c) 2018 Anderson Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol SearchRouterInput {
    
}

protocol SearchRouterDataSource: class {
    
}

protocol SearchRouterDataDestination: class {
    
}

class SearchRouter: SearchRouterInput {
    
    weak var viewController: SearchViewController!
    weak private var dataSource: SearchRouterDataSource!
    weak var dataDestination: SearchRouterDataDestination!
    
    init(viewController: SearchViewController, dataSource: SearchRouterDataSource, dataDestination: SearchRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
}