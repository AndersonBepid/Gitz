//
//  RepositoryInteractor.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright (c) 2018 Anderson Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol RepositoryInteractorInput {
    func searchRepository(request: RepositoryScene.SearchRepository.Request)
}

protocol RepositoryInteractorOutput {
    func presentSearchResult(response: RepositoryScene.SearchRepository.Response)
}

protocol RepositoryDataSource {
    
}

protocol RepositoryDataDestination {
    
}

class RepositoryInteractor: RepositoryInteractorInput, RepositoryDataSource, RepositoryDataDestination {
    
    var output: RepositoryInteractorOutput?
    let searchAssetWorker: SearchAssetWorker = SearchAssetWorker.singleton
    
    // MARK: Business logic

    func searchRepository(request: RepositoryScene.SearchRepository.Request) {
        searchAssetWorker.search(input: request.searchTerm) { (searchResult) in
            self.presentSearchResult(result: searchResult)
        }
    }

    func presentSearchResult(result: InteractorResult<SearchResults>) {
        let reponse = RepositoryScene.SearchRepository.Response(result: result)
        output?.presentSearchResult(response: reponse)
    }
}
