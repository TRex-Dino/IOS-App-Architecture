//
//  CharacterDetailsViewController.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import UIKit

protocol CharacterDetailsViewInputProtocol: AnyObject {
    func displayCharacterName(with title: String)
    func displayCharacterNickname(with title: String)
    func displayCharacterStatus(with title: String)
    func displayImage(with imageData: Data)
    func displayImageForFavoriteButton(with status: Bool)
}

protocol CharacterDetailsViewOutputProtocol: AnyObject {
    init(view: CharacterDetailsViewInputProtocol)
    func showDetails()
    func favoriteButtonPressed()
}

class CharacterDetailsViewController: UIViewController {
    
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var nickNameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    var presenter: CharacterDetailsViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        presenter.favoriteButtonPressed()
    }
}

// MARK: - CourseDetailsViewInputProtocol
extension CharacterDetailsViewController: CharacterDetailsViewInputProtocol {
    func displayCharacterName(with title: String) {
        characterNameLabel.text = title
    }
    
    func displayCharacterNickname(with title: String) {
        nickNameLabel.text = title
    }
    
    func displayCharacterStatus(with title: String) {
        statusLabel.text = title
    }
    
    func displayImage(with imageData: Data) {
        characterImage.image = UIImage(data: imageData)
    }
    
    func displayImageForFavoriteButton(with status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
