//
//  ContentView.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import SwiftUI

struct RepositoriesListView: View {
    @StateObject var viewModel = RepositoriesListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.repositories, id: \.id) { repository in
                NavigationLink(destination: RepositoryDetailView(repository: repository), label: {
                    RepositoryCell(repository: repository)
                        .onAppear {
                            viewModel.loadRepositoriesIfNeeded(currentRepository: repository)
                        }
                })
                
            }
            .navigationBarTitle("GitHub: Swift Projects", displayMode: .inline)
            
        }
        .onAppear {
            viewModel.loadRepositories()
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
                    
                    Spacer()
                    
                    AsyncImageComponent(url: repository.owner.avatar_url, height: 80)
                }
                
                Text(repository.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(width: 150, alignment: .center)
            }
            
            if let description = repository.description {
                Text(description)
                    .font(.body)
            }

            HStack(spacing: 40){
                Label(String("Forks: \(repository.forks_count)"), systemImage: "tuningfork")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Label(String("Stars: \(repository.stargazers_count)"), systemImage: "star")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}
