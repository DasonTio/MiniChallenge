//
//  HomeView+FilteredMenuButton.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 05/12/24.
//
import UIKit

protocol FilteredMenuButtonDelegate: AnyObject {
    func didTapFilterButton(_ filter: String)
}

class FilteredMenuButton: UICollectionViewCell {
    static let identifier = "FilteredMenuButton"
    
    private var filterTitle: String?
    weak var delegate: FilteredMenuButtonDelegate?

    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with title: String, delegate: FilteredMenuButtonDelegate) {
        self.filterTitle = title
        self.delegate = delegate
        button.setTitle(title, for: .normal)
    }
    
    @objc private func buttonTapped() {
        guard let filter = filterTitle else { return }
        delegate?.didTapFilterButton(filter)
    }
}
