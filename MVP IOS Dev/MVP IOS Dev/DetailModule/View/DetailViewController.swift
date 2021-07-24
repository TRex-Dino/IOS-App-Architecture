//
//  DetailViewController.swift
//  MVP IOS Dev
//
//  Created by Dmitry on 23.07.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //когда лейбл загрузился может презентер отработать метод
        presenter.setComment()
    }
    @IBAction func tapAction(_ sender: Any) {
        presenter.tap()
    }
    
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
