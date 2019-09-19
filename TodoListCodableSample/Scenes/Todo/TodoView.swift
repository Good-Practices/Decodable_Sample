//
//  TodoView.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 17/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import UIKit

protocol TodoViewDelegate: class {
    func didSelectRow(at indexPath: IndexPath)
}

class TodoView: UIView {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private var todoListModel: TodoListModel = []
    weak var delegate: TodoViewDelegate?
    
    // MARK: Object Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func changeDataSource(with source: TodoListModel) {
        todoListModel = source
        tableView.reloadData()
    }
    
}

extension TodoView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(at: indexPath)
    }
}

extension TodoView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TodoCell")
            cell.textLabel?.text = todoListModel[indexPath.row].title
            cell.detailTextLabel?.text = todoListModel[indexPath.row].description
            return cell
        }
        cell.textLabel?.text = todoListModel[indexPath.row].title
        cell.detailTextLabel?.text = todoListModel[indexPath.row].description
        return cell
    }
    
}

//MARK: Private Extension
private extension TodoView {
    func setup() {
        backgroundColor = .orange
        addSubview(tableView)
        NSLayoutConstraint.activate(
            [
                tableView.leftAnchor.constraint(equalTo: leftAnchor),
                tableView.rightAnchor.constraint(equalTo: rightAnchor),
                tableView.topAnchor.constraint(equalTo: topAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
}
