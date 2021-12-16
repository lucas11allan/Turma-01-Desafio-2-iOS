//
//  RepositoriesModel.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import Foundation

class RepositoriesListViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    var nextpage = 1
    
    func loadRepositoriesIfNeeded(currentRepository repository: Repository?) {
        guard let repository = repository else {
            loadRepositories()
            return
        }
        
        let tresholdIndex = repositories.index(repositories.endIndex, offsetBy: -1)
        if repositories.firstIndex(where: { $0.id == repository.id }) == tresholdIndex {
            loadRepositories()
        }
        
    }
    
    func loadRepositories() {
        GitHubApi().fetchRepositories(page: nextpage) { (apiResponse) in
            self.repositories += apiResponse.items
            self.nextpage += 1
        }
    }
    
}
