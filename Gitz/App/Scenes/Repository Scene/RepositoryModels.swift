//
//  RepositoryModels.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright (c) 2018 Anderson Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates
//
//  Type "usecase" for some magic!

struct RepositoryScene {

    struct SearchRepository {

        struct Request {
            let searchTerm: String
        }
        
        struct Response {
            let result: InteractorResult<SearchResults>
        }
        
        struct ViewModel {
            enum State {
                case success(searchResults: [Repository])
                case failure(errorMessage: String)
            }

            let state: State
        }
    }
}
