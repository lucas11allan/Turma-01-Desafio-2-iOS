//
//  RepositoriesModel.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import Foundation

class RepositoriesModel {
    var repositories: Repositories?
    
    func updateRepositories(_ response: Repositories) {
        repositories = response
    }
}
