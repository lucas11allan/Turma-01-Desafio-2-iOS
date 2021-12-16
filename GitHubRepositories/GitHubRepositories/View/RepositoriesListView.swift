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
                NavigationLink(destination: RepositoryDetailView(repository: repository), label: {
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

struct RepositoryCell: View {
    var repository: Repository
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text(repository.owner.login)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    AsyncImageComponent(url: repository.owner.avatar_url, height: 70)
                }
                Text(repository.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            Text(repository.description)
                .font(.body)
                .padding()
            
            HStack(spacing: 40){
                Label(String("Forks: \(repository.forks_count)"), systemImage: "tuningfork")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Label(String("Stars: \(repository.stargazers_count)"), systemImage: "star")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
