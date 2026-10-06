//
//  FailableDecodable.swift
//  ServerDrivenUi
//
//  Created by Ronak Malick on 07/02/26.
//

import Foundation

struct FailableDecodable<T: Decodable>: Decodable {
    let value: T?
    
    init(from decoder: Decoder) {
        value = try? T(from: decoder)
    }
}
