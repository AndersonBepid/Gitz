//
//  RepositoryPresenterSpec.swift
//  GitzTests
//
//  Created by Anderson Oliveira on 31/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import XCTest
@testable import Gitz

class RepositoryPresenterSpec: XCTestCase {

    var sut: RepositoryPresenter!
    var outputSpy: RepositoryPresenterOutputSpy!
    let stubbedRepository = [
        
        Repository(id: 1, name: "EverPass", owner: nil, description: "...", dateCreation: nil, stargazers: 2, watchers: 2, forks: 2)
    ]
    
    class RepositoryPresenterOutputSpy: RepositoryPresenterOutput {
        
        // MARK: Methods calls expectations
        
        var displaySearchResultCalled = false
        
        // MARK: Argument expectations
        
        var displaySearchResultViewModel: RepositoryScene.SearchRepository.ViewModel!
        
        // MARK: Spied methods
        
        func displaySearchResult(viewModel: RepositoryScene.SearchRepository.ViewModel) {
            displaySearchResultCalled = true
            displaySearchResultViewModel = viewModel
        }
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = RepositoryPresenter()
        outputSpy = RepositoryPresenterOutputSpy()
        sut.output = outputSpy
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Success
    func testPresentSearchResultSuccess() {
        let response = RepositoryScene.SearchRepository.Response(result: .success(stubbedRepository))
        sut.presentSearchResult(response: response)
    
        XCTAssert(outputSpy.displaySearchResultCalled)
    }
    
    //Failure
    func testPresentSearchResultFailure() {
        let error = NSError(domain: NSURLErrorDomain, code: NSURLErrorCannotConnectToHost, userInfo: nil)
        let response = RepositoryScene.SearchRepository.Response(result: InteractorResult.failure(error))
        
        sut.presentSearchResult(response: response)
        
        XCTAssert(outputSpy.displaySearchResultCalled)
    }
}
