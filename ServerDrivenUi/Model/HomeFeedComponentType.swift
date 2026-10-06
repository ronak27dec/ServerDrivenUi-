//
//  HomeFeedComponentType.swift
//  ServerDrivenUi
//
//  Created by Ronak Malick on 07/02/26.
//

import Foundation


enum HomeFeedComponentType: String, Decodable {
    case text
    case card
    case button
    case unsupported
    
    enum ComponentTypeConstants: String {
        case text = "text"
        case card = "card"
        case button = "button"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = (try? container.decode(String.self)) ?? ""
        
        switch rawValue {
            case ComponentTypeConstants.text.rawValue:
                self = .text
            case ComponentTypeConstants.card.rawValue:
                self = .card
            case ComponentTypeConstants.button.rawValue:
                self = .button
            default:
                self = .unsupported
        }
    }
}
