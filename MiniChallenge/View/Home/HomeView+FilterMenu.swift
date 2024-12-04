//
//  HomeView+FilterMenu.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 04/12/24.
//

import UIKit

extension HomeView {
    func setupFilterMenu(){
        view.addSubview(filterScrollView)
        
        filterScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filterScrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            filterScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            filterScrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
            filterScrollView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        let filterTitles = ["Indian", "Chinese", "Japanese", "French", "Moroccan", "Indonesian"]
        for title in filterTitles {
            let button = UIButton(type: .system)
            var config = UIButton.Configuration.filled()
            config.title = title
            config.buttonSize = .mini
            config.baseBackgroundColor = .gray
            config.baseForegroundColor = .white
            config.background.cornerRadius = 16
            config.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 20,
                bottom: 0,
                trailing: 20
            )
            
            button.configuration = config
            
            button.addAction(UIAction(handler: { [weak self] _ in
                self?.didSelectFilter(button)
            }), for: .touchUpInside)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            filterScrollView.addSubview(button)
            filterMenus.append(button)
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 40),
                button.topAnchor.constraint(equalTo: filterScrollView.topAnchor, constant: 5),
                button.bottomAnchor.constraint(equalTo: filterScrollView.bottomAnchor, constant: -5),
            ])
            
            if(filterMenus.count - 2 >= 0){
                NSLayoutConstraint.activate([
                    button.leadingAnchor.constraint(equalTo: filterMenus[filterMenus.count - 2].trailingAnchor, constant: 16)
                ])
            }
        }
    }
    
    @objc func didSelectFilter(_ sender: UIButton){
        print(sender.titleLabel?.text ?? "")
    }
}
