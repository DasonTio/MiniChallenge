//
//  CollectionView.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 04/12/24.
//

import UIKit

class HomeView: UIViewController {
    
    let searchBar: UISearchBar = UISearchBar()
    let filterScrollView: UIScrollView = UIScrollView()
    var filterMenus : [UIButton] = []
    
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
