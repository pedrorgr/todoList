//
//  EmptyView.swift
//  smithMicroTest
//
//  Created by catiavidinhas on 25/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    private struct ViewTraits {
        
        // Margins
        static let topMargin: CGFloat = 15.0
        static let bottomMargin: CGFloat = 15.0
        
        //Heights
        static let buttonHeight: CGFloat = 50.0
    }
    
    // MARK: Public
    let messageLabel = UILabel()
    let addButton = UIButton()
    
    override init(frame: CGRect) {
        
        // Init
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        setupViews()
        setupViewHierarchy()
        setupViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupLabel()
        setupButton()
    }
    
    private func setupLabel() {
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = "Your todo list is empty"
        messageLabel.textAlignment = .center
    }
    
    private func setupButton() {
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Add items", for: .normal)
        addButton.titleLabel?.textColor = .red
    }
    
    private func setupViewHierarchy() {
        
        addSubview(messageLabel)
        addSubview(addButton)
    }
    
    private func setupViewConstraints() {
        
        NSLayoutConstraint.activate([
            
            // Horizontal
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // Vertical
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.heightAnchor.constraint(equalToConstant: ViewTraits.buttonHeight),
            addButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: ViewTraits.topMargin),
            addButton.heightAnchor.constraint(equalToConstant: ViewTraits.buttonHeight)
            ])
    }
}
