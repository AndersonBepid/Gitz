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
    let dateCreate: String?
    let stargazers: Int?
    let watchers: Int?
    let forks: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case owner = "owner"
        case description = "description"
        case dateCreate = "created_at"
        case stargazers = "stargazers_count"
        case watchers = "watchers_count"
        case forks = "forks_count"
    }
}
