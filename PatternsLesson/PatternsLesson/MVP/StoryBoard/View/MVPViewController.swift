//
//  ViewController.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import UIKit

class MVPViewController: UIViewController, MVPViewInput {

    @IBOutlet weak var textLabel: UILabel!
    
    //ссылка на output
    var output: MVPViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Input
    func showNumbers(_ numbers: [Int]) {
        let numberString = numbers.map{"\($0)"}.joined(separator: ",")
        textLabel.text = numberString
    }
    
    //MARK: - Actions
    @IBAction func didPressedAction(_ sender: Any) {
        output.didPressedAction()
    }
    
}

