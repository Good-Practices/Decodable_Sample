//
//  AdminModel.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 18/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import Foundation

typealias AdminListModel = [AdminModel]

struct AdminModel: Decodable {
    let name: String
    let accessLevel: Int
    // if you make it optional it means that there is a possibility that the key doesn't exist
    let supervisor: String?
}
