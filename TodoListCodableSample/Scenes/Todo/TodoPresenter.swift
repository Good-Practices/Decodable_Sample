//
//  TodoPresenter.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 17/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import Foundation

protocol TodoPresenterDelegate: class {
    func showAlert(for indexPath: IndexPath)
}

class TodoPresenter {
    weak var delegate: TodoPresenterDelegate?
}
