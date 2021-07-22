//
//  MVVMViewController.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import UIKit

class MVVMViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var viewModel: ViewModelDelegate? {
        didSet {
            viewModel?.textDidChangeHandler = { [weak self] text in
                self?.textLabel.text = text
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didPressedAction(_ sender: Any) {
        viewModel?.obtainNumbers()
    }
}
