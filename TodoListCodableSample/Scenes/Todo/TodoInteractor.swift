//
//  TodoInteractor.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 17/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import Foundation

class TodoInteractor {
    private var presenter: TodoPresenter?
    
    required init(presenter: TodoPresenter) {
        self.presenter = presenter
    }
    
    func printSelectedCell(at indexPath: IndexPath) {
        presenter?.delegate?.showAlert(for: indexPath)
    }
}
