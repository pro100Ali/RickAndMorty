//
//  ViewModel.swift
//  RickAndMorty
//
//  Created by Али  on 25.08.2023.
//

import Foundation

class ViewModel: NSObject {
    

    private var apiCaller: APICaller!
    
    
    private(set) var empData : [CharacterInfo]! {
           didSet {
               self.bindViewModelToController()
           }
       }
    
    private(set) var infoCharacter : CharacterInfo! {
           didSet {
               self.bindViewModelToController()
           }
       }
    
    
    var bindViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiCaller = APICaller()
        callFuncToGetEmpData()

    }
    
    
    func callFuncToGetEmpData() {
        
        self.apiCaller.getListOfCharacters { res in
            switch res {
            case .success(let success):
                self.empData = success
            case .failure(let failure):
                print(failure )
            }
        }
    }
    
    func getInfoCharacter(id: Int) {
        
        self.apiCaller.getInfoCharacter(id: id) { res in
            switch res {
            case .success(let success):
                self.infoCharacter = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
