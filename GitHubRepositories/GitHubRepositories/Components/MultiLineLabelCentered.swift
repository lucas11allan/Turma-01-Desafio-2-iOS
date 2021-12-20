//
//  MultiLineLabelCentered.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 17/12/21.
//

import SwiftUI

struct MultiLineLabelCentered: View {
    var text: String
    var image: String
    
    var body: some View {
        Label(text, systemImage: image)
            .font(.subheadline)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .labelStyle(CenterIconLabelStyle())
            .padding(.horizontal)
    }
}
