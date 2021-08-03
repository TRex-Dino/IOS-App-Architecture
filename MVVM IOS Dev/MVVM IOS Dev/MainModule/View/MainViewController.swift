//
//  MainViewController.swift
//  MVVM IOS Dev
//
//  Created by Dmitry on 03.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!

    override func viewDidLoad() {
        //нужно создовать инекцию зависимости извне. Тут делаем как не нужно, создаем внутри
        viewModel = MainViewModel()
        super.viewDidLoad()
        
        createView()
    }
    
    @IBAction func startAction(_ sender: Any) {
        viewModel.startFetch()
    }
    
    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }

    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }

}

