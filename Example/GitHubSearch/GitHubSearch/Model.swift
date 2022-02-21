//
//  Model.swift
//  GitHubSearch
//
//  Created by heyji on 2022/02/21.
//

import Foundation

struct SearchResult {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Item {
    let name: String
    let description: String
}
