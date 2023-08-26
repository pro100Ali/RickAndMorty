//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Али  on 24.08.2023.
//

import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell {
    
    static let identifier = "CharacterCell"
    
    lazy private var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rickAndMorty")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true

        return image
    }()
    
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        addSubview(title)
        backgroundColor = UIColor(red: 0.15, green: 0.16, blue: 0.22, alpha: 1)
        layer.cornerRadius = 16
        setupConstraints()
        image.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ character: CharacterInfo) {
        if let urlImage = character.image {
            image.kf.setImage(with: URL(string: urlImage))
        }
        title.text = character.name
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -54),

            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16)
        ])

    }
}
