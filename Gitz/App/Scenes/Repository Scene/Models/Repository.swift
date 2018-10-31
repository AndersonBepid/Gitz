//
//  Repository.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    
    let id: Int?
    let name: String?
    let owner: Owner?
    let description: String?
    let dateCreation: String?
    let stargazers: Int?
    let watchers: Int?
    let forks: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case owner = "owner"
        case description = "description"
        case dateCreation = "created_at"
        case stargazers = "stargazers_count"
        case watchers = "watchers"
        case forks = "forks"
    }
}

extension Repository: Equatable {

    static func == (lhs: Repository, rhs: Repository) -> Bool {
        return lhs.id == rhs.id
    }
}
