//
//  UserModel.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 18/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import Foundation

struct UserList: Decodable {
    let roomName: String
    let users: [UserModel]
    // if the variable names are exact same as the response we dont need to provide a CodingKeys attribute or decoder
}

struct UserModel: Decodable {
    let name: String
    let surname: String
    let birthday: Date
    
    enum CodingKeys: String, CodingKey {
        // just because the names are same we didnt provide any custom strings for the codingkeys
        case name, surname, birthday
    }
    
    // we provided a decoding initializer because we needed to parse the date time as we need it so custom parsing needs to be implemented customly
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        surname = try container.decode(String.self, forKey: .surname)
        let dateString = try container.decode(String.self, forKey: .birthday)
        guard let date = DateFormatter.iso8601Full.date(from: dateString) else {
            throw DecodingError.keyNotFound(CodingKeys.self as! CodingKey, DecodingError.Context.init(codingPath: [CodingKeys.birthday], debugDescription: "birthday is not parsable"))
        }
        birthday = date
    }
}
