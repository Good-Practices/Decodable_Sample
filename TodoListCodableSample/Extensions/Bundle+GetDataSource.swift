//
//  Bundle+GetDataSource.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 18/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import Foundation

extension Bundle {
    static func getDataSource<D: Decodable>(for resource: String, of type: String) -> D? {
        guard let path = Bundle.main.path(forResource: resource, ofType: type) else { return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONDecoder().decode(D.self, from: data)
            return jsonResult
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
