//
//  Owner.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import Foundation

struct Owner: Decodable {
    
    let id: Int?
    let name: String?
    let url: String?
    let avatar: String?
    let type: String?
    let repos: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "login"
        case url = "url"
        case avatar = "avatar_url"
        case type = "type"
        case repos = "repos_url"
    }
}
