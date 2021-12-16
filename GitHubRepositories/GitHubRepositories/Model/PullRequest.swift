//
//  PullRequest.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 16/12/21.
//

import Foundation

struct PullRequest: Decodable, Identifiable {
    let id = UUID()
    let url: String
    let user: user
    let state: String
    let title: String
    let body: String
    let created_at: Date
    let updated_at: Date
}

struct user: Decodable {
    let login: String
    let avatar_url: String
}
