//
//  HomeFeedRootModel.swift
//  ServerDrivenUi
//
//  Created by Ronak Malick on 07/02/26.
//

import Foundation

struct HomeFeedRootModel: Decodable {
    let version: String
    let screen: String
    let components: [HomeFeedComponent]

    enum CodingKeys: String, CodingKey {
        case version
        case screen
        case components
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        version = try container.decode(String.self, forKey: .version)
        screen  = try container.decode(String.self, forKey: .screen)
        let rawComponents = try container.decode([FailableDecodable<HomeFeedComponent>].self,forKey: .components)
        components = rawComponents.compactMap { $0.value }
    }
}
