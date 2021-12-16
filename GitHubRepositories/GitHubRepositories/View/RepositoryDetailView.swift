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
    @State var branches: [Branch]?
    
    var body: some View {
        if isFetched {
            VStack {
                AsyncImageComponent(url: repository.owner.avatar_url, height: 80)
                    .padding()
                    .scaledToFit()
                    .cornerRadius(12)
                
                Text(repository.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                List(branches!, id: \.id) { branch in
                    Text(branch.name)
                    Text(branch.commit.sha)
                }
                
                Spacer()
                    
                ShareButton(title: "Open PR Page")
            }
            
        } else {
            ProgressView()
                .onAppear {
                    GitHubApi().fetchBranches(repository: repository.full_name) { (apiResponse) in
                        branches = apiResponse
                        isFetched = true
                    }
                }
        }
    }
}

