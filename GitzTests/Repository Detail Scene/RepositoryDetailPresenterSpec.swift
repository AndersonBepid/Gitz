//
//  RepositoryDetailPresenterSpec.swift
//  GitzTests
//
//  Created by Anderson Oliveira on 31/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import XCTest
@testable import Gitz

class RepositoryDetailPresenterSpec: XCTestCase {

    var sut: RepositoryDetailPresenter!
    var outputSpy: RepositoryDetailPresenterOutputSpy!
    var stubbedRepository: SearchResults!
    
    class RepositoryDetailPresenterOutputSpy: RepositoryDetailPresenterOutput {
        
        // MARK: Methods calls expectations
        
        var displaySelectedRepositoryCalled = false
        
        // MARK: Argument expectations
        
        var displaySelectedRepositoryViewModel: RepositoryDetailScene.SelectedRepository.ViewModel!
        
        // MARK: Spied methods
        
        func displaySelectedRepository(viewModel: RepositoryDetailScene.SelectedRepository.ViewModel) {
            displaySelectedRepositoryCalled = true
            displaySelectedRepositoryViewModel = viewModel
        }
    }
    
    override func setUp() {
        sut = RepositoryDetailPresenter()
        outputSpy = RepositoryDetailPresenterOutputSpy()
        sut.output = outputSpy
        let owner = Owner(id: 1, name: "Anderson", url: "", avatar: "", type: "", repos: "")
        stubbedRepository = [Repository(id: 1, name: "EverPass", owner: owner, description: "...", dateCreation: "", stargazers: 2, watchers: 2, forks: 2)]
    }

    override func tearDown() {

    }

    func testPresentSelectedRepository() {
        let response = RepositoryDetailScene.SelectedRepository.Response(repository: stubbedRepository[0])
        
        sut.presentSelectedRepository(response: response)
        
        XCTAssert(outputSpy.displaySelectedRepositoryCalled)
    }
}
