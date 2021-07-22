//
//  MainViewController.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import UIKit

class MainViewController: UIViewController, MainViewDelegate, PresenterInput {

    var output: PresenterOutput!
    var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    func showNumbers(_ numbers: [Int]) {
        let numberString = numbers.map{"\($0)"}.joined(separator: ",")
            mainView.textLabel.text = numberString
    }
    
    func actionDidPressed() {
        output.didPressedAction()
    }
}
