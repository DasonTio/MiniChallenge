//
//  HomeView.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 05/12/24.
//

import UIKit

class HomeView: UIView{
    let scrollView: UIScrollView = .init()
    let contentView: UIView = .init()
    let searchBarComponent: SearchBarComponent = .init()
    let filterMenuComponent: FilterMenuComponent = .init()
    let cardMenuComponent: CardMenuComponent = .init()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
       super.layoutSubviews()
       setupViews()
   }
    
    private func setupViews(){
        addSubview(scrollView)

        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        
        contentView.addSubview(searchBarComponent)
        searchBarComponent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBarComponent.topAnchor.constraint(equalTo: contentView.topAnchor),
            searchBarComponent.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            searchBarComponent.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            searchBarComponent.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(filterMenuComponent)
        filterMenuComponent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterMenuComponent.topAnchor.constraint(equalTo: searchBarComponent.bottomAnchor, constant: 10),
            filterMenuComponent.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            filterMenuComponent.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            filterMenuComponent.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        contentView.addSubview(cardMenuComponent)
        cardMenuComponent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardMenuComponent.topAnchor.constraint(equalTo: filterMenuComponent.bottomAnchor),
            cardMenuComponent.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            cardMenuComponent.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            cardMenuComponent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
