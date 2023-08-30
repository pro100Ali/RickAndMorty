//
//  InfoView.swift
//  RickAndMorty
//
//  Created by Али  on 26.08.2023.
//

import UIKit

class InfoView: UIView {

    lazy private var species: UILabel = {
        let label = UILabel()
        label.text = "Species:"
        label.textColor = UIColor(red: 0.77, green: 0.79, blue: 0.81, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
        
    }()
    
    lazy private var type: UILabel = {
        let label = UILabel()
        label.text = "Type:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.77, green: 0.79, blue: 0.81, alpha: 1)

        return label
    }()
    
    lazy private var gender: UILabel = {
        let label = UILabel()
        label.text = "Gender:"
        label.textColor = UIColor(red: 0.77, green: 0.79, blue: 0.81, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    lazy private var speciesHuman: UILabel = {
        let label = UILabel()
        label.text = "Human"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy private var typeNone: UILabel = {
        let label = UILabel()
        label.text = "None"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    lazy private var genderNone: UILabel = {
        let label = UILabel()
        label.text = "ss"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(species)
        addSubview(type)
        addSubview(gender)
        addSubview(speciesHuman)
        addSubview(typeNone)
        addSubview(genderNone)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ char: CharacterInfo) {
        speciesHuman.text = char.species
        typeNone.text = char.type != "" ? char.type : "None"
        genderNone.text = char.gender != "" ? char.gender : "None"
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            species.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            species.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            speciesHuman.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            speciesHuman.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            type.topAnchor.constraint(equalTo: species.bottomAnchor, constant: 16),
            type.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            gender.topAnchor.constraint(equalTo: type.bottomAnchor, constant: 16),
            gender.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            typeNone.topAnchor.constraint(equalTo: speciesHuman.bottomAnchor, constant: 16),
            typeNone.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            genderNone.topAnchor.constraint(equalTo: typeNone.bottomAnchor, constant: 16),
            genderNone.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            
        ])
    }
}
