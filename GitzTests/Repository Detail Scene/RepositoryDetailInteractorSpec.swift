//
//  RepositoryDetailInteractorSpec.swift
//  GitzTests
//
//  Created by Anderson Oliveira on 31/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import XCTest
@testable import Gitz

class RepositoryDetailInteractorSpec: XCTestCase {

    var sut: RepositoryDetailInteractor!
    var outputSpy: RepositoryDetailInteractorOutputSpy!
    let stubbedRepository = [
        Repository(id: 1, name: "EverPass", owner: nil, description: "...", dateCreation: nil, stargazers: 2, watchers: 2, forks: 2)
    ]
    
    class RepositoryDetailInteractorOutputSpy: RepositoryDetailInteractorOutput {
        
        // MARK: Methods calls expectations
        
        var presentSelectedRepositoryCalled = false
        
        // MARK: Argument expectations
        
        var presentSelectedRepositoryResponse: RepositoryDetailScene.SelectedRepository.Response!
        
        
        // MARK: Spied methods
        
        func presentSelectedRepository(response: RepositoryDetailScene.SelectedRepository.Response) {
            presentSelectedRepositoryCalled = true
            presentSelectedRepositoryResponse = response
        }
    }
    
    override func setUp() {
        sut = RepositoryDetailInteractor()
        outputSpy = RepositoryDetailInteractorOutputSpy()
        sut.output = outputSpy
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresentSelectedRepository() {
        let request = RepositoryDetailScene.SelectedRepository.Request()
        
        sut.repository = stubbedRepository[0]
        sut.selectedRepository(request: request)
        
        XCTAssert(outputSpy.presentSelectedRepositoryCalled)
        XCTAssertEqual(outputSpy.presentSelectedRepositoryResponse.repository, stubbedRepository[0])
    }

}
