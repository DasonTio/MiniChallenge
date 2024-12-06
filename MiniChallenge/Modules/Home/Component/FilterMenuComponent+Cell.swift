//
//  FilterMenuComponent+Cell.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 05/12/24.
//

import UIKit

class FilterMenuComponentCell: UICollectionViewCell {
    static let identifier: String = "FilterMenuComponentCell"
    
    var isActive: Bool = false {
        didSet{
            button.backgroundColor = isActive ? .black: .white
            button.setTitleColor(isActive ? .white: .black, for: .normal)
        }
    }
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.contentEdgeInsets = UIEdgeInsets(
            top: 10,
            left: 20,
            bottom: 10,
            right: 20
        )
        
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
