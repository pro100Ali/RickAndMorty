//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Али  on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModel!
    
    var character: [CharacterInfo] = []
    
    
    lazy private var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 156, height: 202)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        collection.delegate = self
        collection.dataSource = self
        view.backgroundColor = .black
        view.addSubview(collection)
        setupConstraints()
        callToViewModelForUIUpdate()
        
    }
    
    
    func callToViewModelForUIUpdate() {
        
        self.viewModel = ViewModel()
        viewModel.callFuncToGetEmpData()
        
        self.viewModel.bindViewModelToController = {
            
            self.updateDataSource()
        }
    }
    
    
    func updateDataSource(){
        DispatchQueue.main.async { [self] in
            character = viewModel.empData
            collection.reloadData()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return character.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.identifier, for: indexPath) as! CharacterCell
        cell.configure(character[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DescriptionVC()
        vc.configure(character[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
    }
}
