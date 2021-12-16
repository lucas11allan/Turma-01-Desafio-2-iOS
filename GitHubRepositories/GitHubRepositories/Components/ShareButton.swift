//
//  ShareButton.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import SwiftUI

struct ShareButton: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .font(.title2)
            .frame(width: 280, height: 50)
            .background(Color(.black))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
