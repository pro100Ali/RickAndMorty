//
//  Character.swift
//  RickAndMorty
//
//  Created by Али  on 25.08.2023.
//

import Foundation

struct CharacterList: Codable {
    let results: [CharacterInfo]?
    
}

struct CharacterInfo: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let image: String?
}
