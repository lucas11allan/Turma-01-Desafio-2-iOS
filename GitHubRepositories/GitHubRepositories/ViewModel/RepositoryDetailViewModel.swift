//
//  RepositoryDetailViewModel.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 16/12/21.
//

import Foundation

class RepositoryDetailViewModel: ObservableObject {
    @Published var isFetched: Bool = false
    @Published var pulls: [PullRequest]?
    
    func getPulls(adress: String) {
        GitHubApi().fetchPulls(repository: adress) { (apiResponse) in
            self.pulls = apiResponse
            self.isFetched = true
        }
    }
}
