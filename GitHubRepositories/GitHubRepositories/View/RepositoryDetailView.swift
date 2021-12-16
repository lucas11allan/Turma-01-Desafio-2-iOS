//
//  RepositoryDetailView.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import SwiftUI

struct RepositoryDetailView: View {
    @State var repository: Repository
    @StateObject var viewModel = RepositoryDetailViewModel()
    
    var body: some View {
        if viewModel.isFetched {
            VStack {
                AsyncImageComponent(url: repository.owner.avatar_url, height: 80)
                
                Text(repository.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                List(viewModel.pulls!, id: \.id) { pull in
                    Link(destination: URL(string: pull.html_url)!, label: {
                        PullRequestCell(pull: pull)
                    })
                }
            }
            
        } else {
            ProgressView()
                .onAppear {
                    viewModel.getPulls(adress: repository.full_name)
                }
        }
    }
}


struct PullRequestCell: View {
    var pull: PullRequest
    var body: some View {
        VStack {
            HStack {
                VStack{
                    Text(pull.user.login)
                    AsyncImageComponent(url: pull.user.avatar_url, height: 40)
                }
                
                Spacer()
                
                Text(pull.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Text(pull.body)
                .fontWeight(.semibold)
                .lineLimit(5)
            
            HStack {
                Label(String("Creation: \(pull.created_at)"), systemImage: "star")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Label(String("Last Update: \(pull.updated_at)"), systemImage: "star")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
        .foregroundColor(.black)
    }
}

