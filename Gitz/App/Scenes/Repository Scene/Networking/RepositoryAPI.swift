//
//  RepositoryAPI.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import Foundation

enum RepositoryAPI {
    case initialRepositories
    case repositoryQuery(searchTerm: String)
}

extension RepositoryAPI {

    var path: String {
        switch self {
        case .initialRepositories: return "/repositories"
        case .repositoryQuery: return "/search/repositories"
        }
    }

    var urlComponents: URLComponents? {
        return URLComponents(string: AppEnviroment.gitz.workspacesURL + path)
    }

    var query: [URLQueryItem] {
        switch self {
        case .initialRepositories:
            return []
        case .repositoryQuery(let searchTerm):
            return [URLQueryItem(name: "q", value: searchTerm)]
        }
    }
}

