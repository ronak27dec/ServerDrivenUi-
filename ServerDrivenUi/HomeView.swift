//
//  ContentView.swift
//  ServerDrivenUi
//
//  Created by Ronak Malick on 07/02/26.
//

import SwiftUI
import DeviceCheck


struct HomeView: View {
    @State private var root: HomeFeedRootModel?
    
    var body: some View {
        Group {
            if let root {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(root.components) { component in
                            render(component)
                        }
                    }
                    .padding()
                }
            } else {
                ProgressView()
            }
        }
        .task {
            await fetchUI()
        }
    }
    
    private func fetchUI() async {
        guard let url = Bundle.main.url(
            forResource: "HomeFeed",
            withExtension: "json"
        ) else {
            fatalError("HomeFeed.json not found in bundle")
        }
        do {
            let jsonData = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(HomeFeedRootModel.self, from: jsonData)
            root = decoded
        } catch {
            print(error)
        }
    }
    
    @ViewBuilder
    private func render(_ component: HomeFeedComponent) -> some View {
        switch component.data {
            case .text(let data):
                TextComponentView(data: data)
                
            case .card(let data):
                CardComponentView(data: data)
                
            case .button(let data):
                ButtonComponentView(data: data)
                
            case .unsupported:
                EmptyView()
        }
    }
}
