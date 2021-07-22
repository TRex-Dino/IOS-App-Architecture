//
//  ViperViewController.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import UIKit

class ViperViewController: UIViewController, ViperViewInput {

    @IBOutlet weak var textLabel: UILabel!
    
    var output: ViperViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Input
    func showFormattedString(_ string: String) {
        textLabel.text = string
    }
    
    //MARK: - Actions
    @IBAction func didPressedAction(_ sender: Any) {
        output.didPressedAction()
    }
    
}
