//
//  SearchBarComponent.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 05/12/24.
//

import UIKit

class SearchBarComponent: UIView, UISearchBarDelegate {
    
    public var didSearch: (String)->Void = {text in }
    
    private lazy var searchView: UISearchBar = {
        let searchView = UISearchBar()
        searchView.placeholder = "Search..."
        searchView.searchBarStyle = .default
        searchView.backgroundColor = .systemBackground
        searchView.layer.cornerRadius = 10
        
        addSubview(searchView)

        searchView.delegate = self
        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        searchView.layer.cornerRadius = 10
        searchView.clipsToBounds = true
        
        return searchView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView (){
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: topAnchor),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        didSearch(searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
