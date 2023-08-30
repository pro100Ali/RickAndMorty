//
//  APICaller.swift
//  RickAndMorty
//
//  Created by Али  on 25.08.2023.
//

import Foundation


class APICaller {
    
    static let shared = APICaller()
    
    func getListOfCharacters(completion: @escaping (Result<[CharacterInfo], Error>) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let _ = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    let articles = try decoder.decode(CharacterList.self, from: data)
                    
                    completion(.success(articles.results!))
                    
                } catch let error {
                    print("Error was \(error)")
                    completion(.failure(error))
                }
            }
        }.resume()
        
        
    }
    
    func getInfoCharacter(id: Int,completion: @escaping (Result<CharacterInfo, Error>) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/character/\(id)"
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let _ = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    let articles = try decoder.decode(CharacterInfo.self, from: data)
                    
                    completion(.success(articles))
                    
                } catch let error {
                    print("Error was \(error)")
                    completion(.failure(error))
                }
            }
        }.resume()
        
        
    }
    
    func getLocation(id: Int, completion: @escaping (Result<CharacterInfo, Error>) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/location/\(id)"
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let _ = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    let articles = try decoder.decode(CharacterInfo.self, from: data)
                    
                    completion(.success(articles))
                    
                } catch let error {
                    print("Error was \(error)")
                    completion(.failure(error))
                }
            }
        }.resume()
        
        
    }
    
    func getEpisodes(completion: @escaping (Result<[Episodes], Error>) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/episode/"
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let _ = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    let articles = try decoder.decode(EpisodesList.self, from: data)
                    
                    completion(.success(articles.results))
                    
                } catch let error {
                    print("Error was \(error)")
                    completion(.failure(error))
                }
            }
        }.resume()
        
        
    }
}

