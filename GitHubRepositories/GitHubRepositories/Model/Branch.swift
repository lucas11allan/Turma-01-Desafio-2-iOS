//
//  Branch.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import Foundation

struct Branch: Decodable, Identifiable {
    let id = UUID()
    var name: String
    var commit: commit
}

struct commit: Decodable {
    var sha: String
    var url: String
}
