//
//  TodoListViewController.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

protocol TodoListDisplayLogic: class {

    func displayAddItems(viewModel: TodoList.AddItems.ViewModel)
    func displayTodoList(viewModel: TodoList.FetchList.ViewModel)
    func displayDeleteItem(viewModel: TodoList.DeleteItems.ViewModel)
}

class TodoListViewController: UIViewController {

    var interactor: TodoListBusinessLogic?
    var router: (TodoListRoutingLogic & TodoListDataPassing)?
    
    private let sceneView = TodoListView()
    var items = [Item]()
    private var spinnerView = UIView()

    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        
        let viewController = self
        let interactor = TodoListInteractor()
        let presenter = TodoListPresenter()
        let router = TodoListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    override func loadView() {
        view = sceneView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Todo List"
        
        sceneView.todoListTableView.delegate = self
        sceneView.todoListTableView.dataSource = self
        sceneView.todoListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
        sceneView.emptyView.addButton.addTarget(self, action:#selector(addButtonAction), for: .touchUpInside)

        setupNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        spinnerView = UIViewController.displaySpinner(onView: self.view)
        fetchTodoList()
    }
    
    func setupNavigationController() {
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationItem.title = "Todo List"
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeTapped))
        navigationItem.leftBarButtonItem = closeButton
        
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonAction() {
        
        let addItemAlert = UIAlertController(title: "Add item", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] (action) in
            if let userInput = addItemAlert.textFields![0].text {
                if (userInput.isEmpty) {
                    return
                } else {
                    self?.addItems(text: userInput)
                }
            }
        }
        addItemAlert.addTextField(configurationHandler: nil)
        addItemAlert.addAction(okAction)
        present(addItemAlert, animated: true, completion: nil);
    }
    
    @objc func closeTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: Output --- Do something
extension TodoListViewController {

    func fetchTodoList() {

        let request = TodoList.FetchList.Request()
        interactor?.fetchTodoList(request: request)
    }
    
    func addItems(text:String) {
        
        let request = TodoList.AddItems.Request(text: text)
        interactor?.addItems(request: request)
    }
}

// MARK: Input --- Display something
extension TodoListViewController: TodoListDisplayLogic {

    func displayAddItems(viewModel: TodoList.AddItems.ViewModel) {
        fetchTodoList()
    }
    
    func displayTodoList(viewModel: TodoList.FetchList.ViewModel) {

        UIViewController.removeSpinner(spinner: spinnerView)
        items = viewModel.list
        
        if viewModel.list.count == 0 {
            sceneView.emptyView.alpha = 1
            sceneView.todoListTableView.alpha = 0
        } else {
            sceneView.emptyView.alpha = 0
            sceneView.todoListTableView.alpha = 1
            sceneView.todoListTableView.reloadData()
        }
    }
    
    func displayDeleteItem(viewModel: TodoList.DeleteItems.ViewModel) {
        fetchTodoList()
    }
}

// MARK: Routing --- Navigate next scene
extension TodoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

extension TodoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        cell.textLabel?.text = items[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let request = TodoList.DeleteItems.Request(item:items[indexPath.row])
            interactor?.deleteItem(request: request)
        }
    }
}
