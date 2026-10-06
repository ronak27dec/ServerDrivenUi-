//
//  TextComponentView.swift
//  ServerDrivenUi
//
//  Created by Ronak Malick on 07/02/26.
//

import SwiftUI

struct TextComponentView: View {
    let data: TextData
    
    var body: some View {
        Text(data.text)
            .font(data.style == "headline" ? .largeTitle : .body)
            .fontWeight(.bold)
    }
}
