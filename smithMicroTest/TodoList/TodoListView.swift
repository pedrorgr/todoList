//
//  LoginView.swift
//  smithMicroTest
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

class TodoListView: UIView {

    private struct ViewTraits {

        // Margins
        static let topMargin: CGFloat = 15.0
    }

    // MARK: Public
    let todoListTableView = UITableView()
    let emptyView = EmptyView()
    
    override init(frame: CGRect) {

        // Init
        super.init(frame: frame)

        backgroundColor = .white

        // Add subviews
        setupViews()
        setupViewHierarchy()
        setupViewConstraints()
    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        
        setupTableView()
        setupEmptyView()
    }
    
    private func setupTableView() {
        
        todoListTableView.translatesAutoresizingMaskIntoConstraints = false
        todoListTableView.separatorStyle = .none
    }
    
    private func setupEmptyView() {
        
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.alpha = 0
    }
    
    private func setupViewHierarchy() {
        addSubview(todoListTableView)
        addSubview(emptyView)
    }
    
    private func setupViewConstraints() {

        NSLayoutConstraint.activate([

            // Horizontal
            // Remember to use safeAreaLayoutGuide if iOS 11 and up
            todoListTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            todoListTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: trailingAnchor),

            // Vertical
            todoListTableView.topAnchor.constraint(equalTo: topAnchor),
            todoListTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            emptyView.topAnchor.constraint(equalTo: topAnchor),
            emptyView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
