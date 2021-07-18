//
//  CharacterTableViewCell.swift
//  MVVM simple example
//
//  Created by Dmitry on 17.07.2021.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    var viewModel: CharacterCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.characterName
            guard let imageData = viewModel.imageData else { return }
            content.image = UIImage(data: imageData)
            contentConfiguration = content
        }
    }
}
