//
//  ButtonComponentView.swift
//  ServerDrivenUi
//
//  Created by Ronak Malick on 07/02/26.
//

import SwiftUI

struct ButtonComponentView: View {
    let data: ButtonData
    
    var body: some View {
        Button(data.title) {
            handleAction(data.action)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private func handleAction(_ action: ButtonAction) {
        switch action.type {
            case "navigate":
                print("Navigate to:", action.destination)
            default:
                break
        }
    }
}
