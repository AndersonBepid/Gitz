//
//  SearchResultRepository.swift
//  Gitz
//
//  Created by Anderson Oliveira on 29/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import Foundation

struct SearchResultRepository: Decodable {

    let amount: Int
    let repositories: [Repository]

    enum CodingKeys: String, CodingKey {
        case amount = "total_count"
        case repositories = "items"
    }
}
