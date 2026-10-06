//
//  CardComponentView.swift
//  ServerDrivenUi
//
//  Created by Ronak Malick on 07/02/26.
//

import SwiftUI

struct CardComponentView: View {
    let data: CardData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: data.image_url))
                .frame(height: 160)
                .clipped()
            
            Text(data.title)
                .font(.headline)
            
            Text(data.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}
