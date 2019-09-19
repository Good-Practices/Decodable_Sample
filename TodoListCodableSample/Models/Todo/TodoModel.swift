//
//  TodoModel.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 17/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import Foundation

// if we need a list of decoded model and it doesn't have any keys to access it than creating typealias is the best option rather than doing '[TodoModel].self' everywhere
typealias TodoListModel = [TodoModel]

struct TodoModel: Decodable {
    let id: Int
    let title: String
    let description: String
    let createdDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, description
//        this case we wanted to provide a custom key
        case createdDate = "date"
//        why we need this is most of the backend is developed with different language with comes up with different coding styles as snake_case or PascalCase kebab-case but we use in swift camelCase so our variables needs to follow up the swift guidelines
    }
}
