//
//  HomeView+SearchBar.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 04/12/24.
//


import UIKit

extension HomeView: UISearchBarDelegate {
    func setupSearchBar(){
        view.addSubview(searchBar)
        
        searchBar.placeholder = "Search..."
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
           searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
           searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
           searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
           searchBar.heightAnchor.constraint(equalToConstant: 44)
       ])
       
       searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search text: \(searchBar.text ?? "")")
        searchBar.resignFirstResponder() // Hide the keyboard
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text changed: \(searchText)")
    }
}
