//
//  FilterMenuComponent.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 05/12/24.
//

import UIKit

class FilterMenuComponent: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    var didFilter: (([String]) -> Void) = {text in}
    var filteredMenu: [String] = []
    var menus: [String] = ["Japanese", "Chinese", "Indian", "British", "Portuguese", "Jamaican", "French", "Mexican", "Greek", "American"]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 24
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(
            FilterMenuComponentCell.self,
            forCellWithReuseIdentifier: FilterMenuComponentCell.identifier
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        print(menus.count)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterMenuComponentCell.identifier, for: indexPath) as? FilterMenuComponentCell ?? FilterMenuComponentCell()
        
        print(menus[indexPath.row])
        cell.config(title: menus[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = menus[indexPath.row]
        let width = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]).width + 30
        let height: CGFloat = collectionView.frame.height - 20 
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? FilterMenuComponentCell ?? FilterMenuComponentCell()
        cell.isActive.toggle()
        
        let menu = menus[indexPath.row]
        if(filteredMenu.contains{$0 == menu}){
            filteredMenu.removeAll{$0 == menu}
        }else{
            filteredMenu.append(menu)
        }
        
        didFilter(self.filteredMenu)
    }
}
