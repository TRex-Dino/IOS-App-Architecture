//
//  CharacterCell.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class CharacterViewCell: UITableViewCell, CellModelRepresentable {
    var viewModel: CellIdentifiable? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? CharacterCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.characterName
        if let imageData = ImageManager.shared.fetchImageData(from: viewModel.imageURL) {
            content.image = UIImage(data: imageData)
        }
        contentConfiguration = content
    }
}
