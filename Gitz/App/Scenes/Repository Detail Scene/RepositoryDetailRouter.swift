//
//  RepositoryDetailRouter.swift
//  Gitz
//
//  Created by Anderson Oliveira on 29/10/18.
//  Copyright (c) 2018 Anderson Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol RepositoryDetailRouterInput {
    
}

protocol RepositoryDetailRouterDataSource: class {
    
}

protocol RepositoryDetailRouterDataDestination: class {
    var repository: Repository! { get set }
}

class RepositoryDetailRouter: RepositoryDetailRouterInput {
    
    weak var viewController: RepositoryDetailViewController!
    weak private var dataSource: RepositoryDetailRouterDataSource!
    weak var dataDestination: RepositoryDetailRouterDataDestination!
    
    init(viewController: RepositoryDetailViewController, dataSource: RepositoryDetailRouterDataSource, dataDestination: RepositoryDetailRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        
    }
}
