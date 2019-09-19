//
//  MessageModel.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 18/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import Foundation

typealias MessageListModel = [MessageModel]

struct MessageModel: Decodable {
    let type: MessageType
    let caption: String?
}
