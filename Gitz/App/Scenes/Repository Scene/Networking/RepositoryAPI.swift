//
//  QuotesAPI.swift
//  FastTrade
//
//  Created by usuario on 02/08/18.
//  Copyright © 2018 Cedro Technologies. All rights reserved.
//

import Foundation

enum RepositoryAPI {
    case initialRepositories
    case repositoryQuery(searchTerm: String)
}

extension RepositoryAPI {

    var baseURL: URL {
        return URL(string: AppEnviroment.gitz.workspacesURL)!
    }

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

