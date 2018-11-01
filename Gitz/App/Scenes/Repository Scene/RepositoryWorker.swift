//
//  RepositoryWorker.swift
//  Gitz
//
//  Created by Anderson Oliveira on 29/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import Foundation

typealias SearchResults = [Repository]

class RepositoryWorker {

    static let singleton = RepositoryWorker()

    func search(input: String, page: String = "1", _ completion: @escaping (_ searchResults: InteractorResult<SearchResultRepository>) -> Void) {
        let repositoryAPI = RepositoryAPI.repositoryQuery(searchTerm: input, page: page)

        guard var urlComponents = repositoryAPI.urlComponents else { return }
        urlComponents.queryItems = repositoryAPI.query

        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let searchResultRepository = try JSONDecoder().decode(SearchResultRepository.self, from: data)
                completion(.success(searchResultRepository))
            } catch {
                completion(.failure(error as NSError))
            }
        }
        task.resume()
    }
}
