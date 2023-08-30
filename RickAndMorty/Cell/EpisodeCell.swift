//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Али  on 24.08.2023.
//

import UIKit
import Kingfisher

class EpisodeCell: UICollectionViewCell {
    
    static let identifier = "EpisodeCell"
    
 
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy private var episode: UILabel = {
        let label = UILabel()
        label.text = "episode"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor(red: 0.28, green: 0.77, blue: 0.04, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy private var date: UILabel = {
        let label = UILabel()
        label.text = "December 2, 2013"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(red: 0.58, green: 0.6, blue: 0.61, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        addSubview(episode)
        addSubview(date)
        backgroundColor = UIColor(red: 0.15, green: 0.16, blue: 0.22, alpha: 1)
        layer.cornerRadius = 16
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ character: Episodes) {
     
        title.text = character.name
        date.text = character.air_date
        episode.text = character.episode
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            episode.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            episode.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            
            
            date.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            date.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            
        ])

    }
}
