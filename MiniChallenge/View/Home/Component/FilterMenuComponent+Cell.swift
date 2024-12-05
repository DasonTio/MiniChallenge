//
//  FilterMenuComponent+Cell.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 05/12/24.
//

import UIKit

class FilterMenuComponentCell: UICollectionViewCell {
    static let identifier: String = "FilterMenuComponentCell"
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.contentEdgeInsets = UIEdgeInsets(
            top: 10,
            left: 20,
            bottom: 10,
            right: 20
        )
        
//        button.configuration?.contentInsets.leading = 100
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func config(title:String){
        print("SET", title)
        button.setTitle(title, for: .normal)
    }
    
    private func setupView(){
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
