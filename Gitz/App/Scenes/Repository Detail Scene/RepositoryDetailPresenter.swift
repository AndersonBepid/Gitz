//
//  RepositoryDetailPresenter.swift
//  Gitz
//
//  Created by Anderson Oliveira on 29/10/18.
//  Copyright (c) 2018 Anderson Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol RepositoryDetailPresenterInput {
    func presentSelectedRepository(response: RepositoryDetailScene.SelectedRepository.Response)
}

protocol RepositoryDetailPresenterOutput: class {
    func displaySelectedRepository(viewModel: RepositoryDetailScene.SelectedRepository.ViewModel)
}

class RepositoryDetailPresenter: RepositoryDetailPresenterInput {
    
    weak var output: RepositoryDetailPresenterOutput?
    
    // MARK: Presentation logic

    func presentSelectedRepository(response: RepositoryDetailScene.SelectedRepository.Response) {
        let imageUrl = response.repository.owner.avatar
        let username = response.repository.owner.name
        let type = response.repository.owner.type
        let since = response.repository.dateCreation
        let name = response.repository.name
        let watchers = formatter(value: response.repository.watchers)
        let stargazers = formatter(value: response.repository.stargazers)
        let forks = formatter(value: response.repository.forks)
        let description = response.repository.description ?? "No description."

        let viewModel = RepositoryDetailScene.SelectedRepository.ViewModel(imageUrl: imageUrl,
                                                                           usermane: username,
                                                                           type: type,
                                                                           since: since,
                                                                           repositoryName: name,
                                                                           watchers: watchers,
                                                                           stargazers: stargazers,
                                                                           forks: forks,
                                                                           description: description)
        output?.displaySelectedRepository(viewModel: viewModel)
    }

    private func formatter(value: Int?) -> String {
        guard let value = value else { return "--" }
        return String(value)
    }
}
