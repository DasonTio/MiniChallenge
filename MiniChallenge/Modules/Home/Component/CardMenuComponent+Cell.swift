//
//  CardMenuComponent+Cell.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//

import UIKit

class CardMenuComponentCell: UICollectionViewCell {
    static let identifier: String = "CardMenuComponentCell"
    let component: UIStackView = .init()
    let imageView: UIImageView = .init()
    let title: UILabel = {
        let uiLabel: UILabel = .init()
        uiLabel.font = .systemFont(ofSize: 18)
        uiLabel.textColor = .white
        uiLabel.backgroundColor
        return uiLabel
    }()
    
    let label: UILabel = {
        let uiLabel = UILabel()
        uiLabel.font = .systemFont(ofSize: 12)
        uiLabel.textColor = .black
        uiLabel.backgroundColor = .white
        return uiLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFrame()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFrame()
    }
    
    private func setupFrame(){
        contentView.addSubview(component)
        contentView.backgroundColor = .black
        component.axis = .vertical
        component.alignment = .leading
        component.addArrangedSubview(imageView)
        component.addArrangedSubview(title)
        component.addArrangedSubview(label)
        
        component.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            component.topAnchor.constraint(equalTo: contentView.topAnchor),
            component.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            component.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            component.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    
    public func config(title: String, label: String, image: String){
        self.title.text = title
        self.label.text = label
        
        let url = URL(string: image)
        if let url {
            URLSession.shared.dataTask(with: url){data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.imageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}
