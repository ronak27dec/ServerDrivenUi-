//
//  HomeFeedComponent.swift
//  ServerDrivenUi
//
//  Created by Ronak Malick on 07/02/26.
//

import Foundation

struct HomeFeedComponent: Decodable, Identifiable {
    let id: String
    let type: HomeFeedComponentType
    let data: HomeFeedComponentData
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(HomeFeedComponentType.self, forKey: .type)
        switch type {
            case .text:
                data = .text(try container.decode(TextData.self, forKey: .data))
            case .card:
                data = .card(try container.decode(CardData.self, forKey: .data))
            case .button:
                data = .button(try container.decode(ButtonData.self, forKey: .data))
            case .unsupported:
                data = .unsupported
        }
    }
}
