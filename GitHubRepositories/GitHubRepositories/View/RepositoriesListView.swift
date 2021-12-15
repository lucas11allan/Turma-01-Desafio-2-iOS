//
//  ContentView.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import SwiftUI

struct RepositoriesListView: View {
    @State var repositories: [Repository] = []
    @State var isFetched:Bool = false
    
    var body: some View {
        NavigationView {
            List(repositories, id: \.id) { repository in
                NavigationLink(destination: RepositoryDetailView(), label: {
                    RepositoryCell(repository: repository)
                })
                
            }
            .navigationTitle("GitHub Swift Projects")
        }
        .onAppear {
            GitHubApi().fetchRepositories { (apiResponse) in
                repositories = apiResponse.items
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesListView()
    }
}

struct RepositoryCell: View {
    var repository: Repository
    
    var body: some View {
        Text(repository.name)
            .fontWeight(.semibold)
            .lineLimit(2)
            .minimumScaleFactor(0.5)
    }
}
