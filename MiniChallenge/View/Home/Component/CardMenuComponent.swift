//
//  CardMenuComponent.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//

import UIKit

class CardMenuComponent: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private var collectionViewHeightConstraint: NSLayoutConstraint?
    
    var unfilteredData: [Meal] = []
    var data: [Meal] = [
        Meal(
            id: ".",
            title: ".",
            description: ".",
            from: ".",
            image: ".",
            category: "."
        )
    ] {
        didSet {
            collectionView.reloadData()
            updateCollectionViewHeight()
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 24
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CardMenuComponentCell.self, forCellWithReuseIdentifier: CardMenuComponentCell.identifier)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        print(data.count)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCollectionViewHeight()
    }
    
    func updateCollectionViewHeight() {
        collectionView.layoutIfNeeded()
        
        let contentHeight = collectionView.contentSize.height
        collectionViewHeightConstraint?.constant = contentHeight
        
        layoutIfNeeded()
    }
    
    private func setupView(){
        addSubview(collectionView)
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
        collectionViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMenuComponentCell.identifier, for: indexPath) as? CardMenuComponentCell ?? CardMenuComponentCell()
        
        let data = self.data[indexPath.row]
        cell.config(title: data.title, label: data.from, image: data.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 24) / 2, height: 200)
    }
}
