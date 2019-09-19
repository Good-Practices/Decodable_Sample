//
//  ViewController.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 17/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {
    
    // MARK: - Private Variables
    private let todoView = TodoView()
    private var interactor: TodoInteractor?
    private lazy var todoRouter = TodoRouter(viewController: self)
    
    // MARK: - Object Lifecyle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        prepareViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = todoView
    }
    
}

// MARK: - TodoViewDelegate
extension TodoViewController: TodoViewDelegate {
    func didSelectRow(at indexPath: IndexPath) {
        interactor?.printSelectedCell(at: indexPath)
    }
}

// MARK: - TodoPresenterDelegate
extension TodoViewController: TodoPresenterDelegate {
    func showAlert(for indexPath: IndexPath) {
       todoRouter.showAlert(for: indexPath)
    }
}

// MARK: - Private Extension
private extension TodoViewController {
    func prepareViewController() {
        todoView.delegate = self
        let presenter = TodoPresenter()
        presenter.delegate = self
        interactor = TodoInteractor(presenter: presenter)
        printObjects()
    }
    
    func printObjects() {
        guard let personResult: PersonList = Bundle.getDataSource(for: "PersonListJson", of: "json") else { return }
        print(personResult)
        print("-------------------------------------------------\n")
        guard let userResult: UserList = Bundle.getDataSource(for: "UserModelJson", of: "json") else { return }
        print(userResult)
        print("-------------------------------------------------\n")
        guard let adminResult: AdminListModel = Bundle.getDataSource(for: "AdminListJson", of: "json") else { return }
        print(adminResult)
        print("-------------------------------------------------\n")
        guard let messageResult: MessageListModel = Bundle.getDataSource(for: "MessageJsonList", of: "json") else { return }
        print(messageResult)
        print("-------------------------------------------------\n")
        guard let todoResult: TodoListModel = Bundle.getDataSource(for: "TodoListJson", of: "json") else { return }
        todoView.changeDataSource(with: todoResult)
        print("-------------------------------------------------\n")
    }
}
