//
//  HomeView.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 05/12/24.
//

import UIKit

class HomeView: UIView{
    let searchBarComponent: SearchBarComponent = .init()
    let filterMenuComponent: FilterMenuComponent = .init()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(searchBarComponent)
        
        searchBarComponent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBarComponent.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchBarComponent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            searchBarComponent.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            searchBarComponent.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        addSubview(filterMenuComponent)
        filterMenuComponent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterMenuComponent.topAnchor.constraint(equalTo: searchBarComponent.bottomAnchor, constant: 10),
            filterMenuComponent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            filterMenuComponent.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            filterMenuComponent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            filterMenuComponent.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
}
