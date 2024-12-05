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
        filterScrollView.delegate = self
        filterScrollView.dataSource = self
        filterScrollView.allowsSelection = true
        
        filterScrollView.register(FilteredMenuButton.self, forCellWithReuseIdentifier: FilteredMenuButton.identifier)
        
        NSLayoutConstraint.activate([
            filterScrollView.heightAnchor.constraint(equalToConstant: 50),
            filterScrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            filterScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            filterScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}


extension HomeView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, FilteredMenuButtonDelegate{
    
    func didTapFilterButton(_ filter: String) {
        print(filter)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.filterMenus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilteredMenuButton.identifier, for: indexPath) as? FilteredMenuButton else {
            return UICollectionViewCell()
        }
        let title = filterMenus[indexPath.item]
        cell.configure(with: title, delegate: self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = filterScrollView.frame.width / 3
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedFilter = filterMenus[indexPath.item]
        print("Selected filter: \(selectedFilter)")
        // Handle the filter selection here
        // For example, update UI or filter data based on selection
    }
    
    
    
}
