//
//  RepositoryDetailView.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import SwiftUI

struct RepositoryDetailView: View {
    @State var repository: Repository
    @State var isFetched:Bool = false
    @State var pulls: [PullRequest]?
    
    var body: some View {
        if isFetched {
            VStack {
                AsyncImageComponent(url: repository.owner.avatar_url, height: 80)
                
                Text(repository.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                List(pulls!, id: \.id) { pull in
                    VStack {
                        Text(pull.title)
                        HStack {
                            VStack{
                                Text(pull.user.login)
                                AsyncImageComponent(url: pull.user.avatar_url, height: 40)
                            }
                            Text(pull.body)
                        }
                        HStack {
                            Label(String("Creation: \(pull.created_at)"), systemImage: "star")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Label(String("Last Update: \(pull.updated_at)"), systemImage: "star")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                    }
                    
                }
            }
            
        } else {
            ProgressView()
                .onAppear {
                    GitHubApi().fetchPulls(repository: repository.full_name) { (apiResponse) in
                        pulls = apiResponse
                        isFetched = true
                    }
                }
        }
    }
}

