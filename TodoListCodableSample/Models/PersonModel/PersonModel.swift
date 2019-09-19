//
//  PersonModel.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 18/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import Foundation
typealias PersonList = [PersonModel]

enum PersonModel: Decodable {
    case admin(AdminModel)
    case user(UserModel)
    
    enum CodingKeys: String, CodingKey {
        case admin, user
    }
    
    enum PersonModelError: Error {
        case decoding(String)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(AdminModel.self) {
            self = .admin(value)
            return
        }
        if let value = try? container.decode(UserModel.self) {
            self = .user(value)
            return
        }
        throw PersonModelError.decoding("type not found this is not decodable")
    }
}
