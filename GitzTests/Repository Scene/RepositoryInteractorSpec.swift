//
//  RepositoryInteractorSpec.swift
//  GitzTests
//
//  Created by Anderson Oliveira on 30/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import XCTest
@testable import Gitz

class RepositoryInteractorSpec: XCTestCase {

    var sut: RepositoryInteractor!
    var outputSpy: RepositoryInteractorOutputSpy!
    var searchAssetWorkerSpy: RepositoryWorkerSpy!
    
    class RepositoryInteractorOutputSpy: RepositoryInteractorOutput {
        
        // MARK: Methods calls expectations
        
        var presentSearchResultCalled = false
        
        // MARK: Argument expectations
        
        var presentSearchResultResponse: RepositoryScene.SearchRepository.Response!
        
        
        // MARK: Spied methods
        
        func presentSearchResult(response: RepositoryScene.SearchRepository.Response) {
            presentSearchResultCalled = true
            presentSearchResultResponse = response
        }
    }
    
    class RepositoryWorkerSpy: RepositoryWorker {
        
        let stubbedRepository = [
            Repository(id: 1, name: "EverPass", owner: nil, description: "...", dateCreation: nil, stargazers: 2, watchers: 2, forks: 2)
        ]
        
        // MARK: Methods calls expectations
        
        var searchCalled = false
        
        // MARK: Argument expectations
        
        var searchArgument: String!
        
        // MARK: Spied methods
        
        override func search(input: String, _ completion: @escaping (InteractorResult<SearchResults>) -> Void) {
            searchCalled = true
            searchArgument = input
            completion(InteractorResult.success(stubbedRepository))
        }
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        searchAssetWorkerSpy = RepositoryWorkerSpy()
        sut = RepositoryInteractor(searchAssetWorker: searchAssetWorkerSpy)
        outputSpy = RepositoryInteractorOutputSpy()
        sut.output = outputSpy
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    let stubbedRepository = [
        Repository(id: 1, name: "EverPass", owner: nil, description: "...", dateCreation: nil, stargazers: 2, watchers: 2, forks: 2)
    ]

    func testSearchRepository() {
        let request = RepositoryScene.SearchRepository.Request(searchTerm: "a")
        sut.searchRepository(request: request)
        
        XCTAssert(outputSpy.presentSearchResultCalled)
    }
    
    func testSelectRepository() {
        let request = RepositoryScene.SelectRepository.Request(selectedRepository: stubbedRepository[0])
        sut.selectRepository(request: request)
        
        XCTAssertEqual(request.selectedRepository, sut.selectedRepository)
    }

}
