//
//  CharacterDetailsViewController.swift
//  MVVM simple example
//
//  Created by Dmitry on 17.07.2021.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    var viewModel: CharacterDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.favoriteButtonPressed()
    }
    
    private func setupUI() {
        setStatusForFavoriteButton()
        viewModel.viewModelDidChange = { [weak self] viewModel in
            self?.setStatusForFavoriteButton()
        }
        characterNameLabel.text = viewModel.name
        nicknameLabel.text = viewModel.nickname
        statusLabel.text = viewModel.status
        guard let imageData = viewModel.imageData else { return }
        characterImage.image = UIImage(data: imageData)
    }
    
    private func setStatusForFavoriteButton() {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
}
