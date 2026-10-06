//
//  HomeFeedComponentData.swift
//  ServerDrivenUi
//
//  Created by Ronak Malick on 07/02/26.
//

import Foundation

enum HomeFeedComponentData: Decodable {
    case text(TextData)
    case card(CardData)
    case button(ButtonData)
    case unsupported
}
