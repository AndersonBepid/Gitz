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
        guard let imageUrl = response.repository.owner?.avatar,
              let username = response.repository.owner?.name,
              let type = response.repository.owner?.type,
              let since = response.repository.dateCreation
        else { return }
        let viewModel = RepositoryDetailScene.SelectedRepository.ViewModel(imageUrl: imageUrl,
                                                                           usermane: username,
                                                                           type: type,
                                                                           since: since)
        output?.displaySelectedRepository(viewModel: viewModel)
    }
}
