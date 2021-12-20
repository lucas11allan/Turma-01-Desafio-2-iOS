//
//  AsyncImage.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import SwiftUI

struct AsyncImageComponent: View {
    var url: String
    var height: Int
    
    var body: some View {
        AsyncImage(url: URL(string: url)) {image in
            image
                .resizable()
                .scaledToFit()
                .frame(height: CGFloat(height))
                .cornerRadius(4)
                .padding()
        } placeholder: {
            ProgressView()
        }
    }
}
