//
//  MainView.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func actionDidPressed()
}

class MainView: UIView {

    weak var delegate: MainViewDelegate?
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Push Me", for: .normal)
        button.addTarget(self, action: #selector(didPressedActionButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        
        textLabel.text = "Hello"
        
        addSubview(textLabel)
        addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            textLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didPressedActionButton() {
        delegate?.actionDidPressed()
    }
}
