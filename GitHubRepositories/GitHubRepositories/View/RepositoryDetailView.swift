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
            Text("Pull Request's List")
                .font(.title2)
            VStack {
                AsyncImageComponent(url: repository.owner.avatar_url, height: 80)
                
                Text(repository.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                if viewModel.pulls.count == 0 {
                    Spacer()
                    Text("There aren't any open Pull Requests in this repository")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                } else {
                    List(viewModel.pulls, id: \.id) { pull in
                        Link(destination: URL(string: pull.html_url)!, label: {
                            PullRequestCell(pull: pull)
                        })
                    }
                }
                
            }
            .navigationBarTitle("", displayMode: .inline)
            
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
                        .fontWeight(.semibold)
                    AsyncImageComponent(url: pull.user.avatar_url, height: 60)
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
                .lineLimit(5)
                .padding(.vertical)
            
            HStack {
                MultiLineLabelCentered(text: String("Creation:\n\(pull.created_at.formatted(.dateTime.year().month().day()))"), image: "star")
                
                Spacer()
                
                MultiLineLabelCentered(text: String("Last Update:\n\(pull.updated_at.formatted(.dateTime.year().month().day()))"), image: "arrow.up.circle")
            }
            
        }
        .foregroundColor(.black)
    }
}

