//
//  Repositories.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import Foundation

struct Repositories: Decodable {
    let total_count: Int
    let items: [Repository]
}
