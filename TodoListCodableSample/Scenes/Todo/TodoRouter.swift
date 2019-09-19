//
//  TodoRouter.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 17/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import UIKit

class TodoRouter {
    private var todoViewController: TodoViewController?
    
    required init(viewController: TodoViewController) {
        todoViewController = viewController
    }
    
    func showAlert(for indexPath: IndexPath) {
        let alert = UIAlertController(title: "Some State", message: "selected Cell is \(indexPath.row)", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .destructive, handler: nil))
        todoViewController?.present(alert, animated: true, completion: nil)
    }
}
