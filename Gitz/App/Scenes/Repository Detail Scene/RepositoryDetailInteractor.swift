//
//  RepositoryDetailInteractor.swift
//  Gitz
//
//  Created by Anderson Oliveira on 29/10/18.
//  Copyright (c) 2018 Anderson Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol RepositoryDetailInteractorInput {
    
}

protocol RepositoryDetailInteractorOutput {
    func presentSelectedRepository(response: RepositoryDetailScene.SelectedRepository.Response)
}

protocol RepositoryDetailDataSource {
    
}

protocol RepositoryDetailDataDestination {
    var repository: Repository! { get }
}

class RepositoryDetailInteractor: RepositoryDetailInteractorInput, RepositoryDetailDataSource, RepositoryDetailDataDestination {

    var output: RepositoryDetailInteractorOutput?
    var repository: Repository!

    // MARK: Business logic

    func selectedRepository(request: RepositoryDetailScene.SelectedRepository.Request) {
        let response = RepositoryDetailScene.SelectedRepository.Response(repository: repository)
        output?.presentSelectedRepository(response: response)
    }
}