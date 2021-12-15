//
//  Repository.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import Foundation

struct Repository: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let full_name: String
    let owner: owner
    let description: String
    let url: String
    let created_at: Date
    let updated_at: Date
    let stargazers_count: Int
    let language: String
    let forks_count: Int
    let topics: [String]
}

struct owner: Codable {
    let avatar_url: String
    let followers_url: String
    let following_url: String
    
}
