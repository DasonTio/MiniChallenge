//
//  CollectionView.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 04/12/24.
//

import UIKit

class HomeView: UIViewController {
    
    let searchBar: UISearchBar = .init()
    var filterScrollView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    var filterMenus : [String] = ["Indian", "Chinese", "American", "Japanese", "Mexican", "Italian", "Korean", "Vietnamese", "Thai"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSearchBar()
        setupFilterMenu()
        setupCards()
    }
    
    func setupCards() {
        
    }
}

#Preview{
    HomeView()
}
