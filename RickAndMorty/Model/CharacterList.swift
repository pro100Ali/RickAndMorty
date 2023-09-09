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
    let type: String?
    let status: String?
    let species: String?
    let image: String?
    let origin: Origin?
    let gender: String?
}

struct Origin: Codable {
    let name: String?
    let url: String?
}


struct EpisodesList: Codable {
    let results: [Episodes]
}

struct Episodes: Codable {
    let id: Int?
    let name: String?
    let air_date: String?
    let episode: String?
    
}

struct Arushok: Codable {
    let id: Int?
    let name: Int?
}

struct Plane: Codable {
    let id: Int?
    let name: Int?
}
