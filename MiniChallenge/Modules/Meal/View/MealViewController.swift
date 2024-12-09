//
//  MealViewController.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//
import UIKit

protocol MealViewProtocol: AnyObject{
}

class MealViewController: UIViewController, MealViewProtocol {
    var meal: Meal?
    var presenter: MealPresenter?
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    init(meal: Meal? = nil, presenter: MealPresenter? = nil) {
        self.meal = meal
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.title = meal?.title
        
        setupScrollView()
        setupView()
        setupImage()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
    
    private func setupImage(){
        guard let imageUrlString = meal?.image, let url = URL(string: imageUrlString) else { return }
        
        URLSession.shared.dataTask(with: url){ [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
            }
        }.resume()
    }
    
    private func setupView() {
        contentView.addArrangedSubview(titleLabel)
        titleLabel.text = meal?.title
        
        contentView.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        let ingredientsTitle = UILabel()
        ingredientsTitle.text = "Ingredients"
        ingredientsTitle.font = .systemFont(ofSize: 18, weight: .semibold)
        ingredientsTitle.numberOfLines = 0
        contentView.addArrangedSubview(ingredientsTitle)
        
        guard let ingredients = meal?.ingredients else {
            let noIngredientsLabel = UILabel()
            noIngredientsLabel.text = "No ingredients available."
            noIngredientsLabel.font = .systemFont(ofSize: 14, weight: .regular)
            noIngredientsLabel.numberOfLines = 0
            contentView.addArrangedSubview(noIngredientsLabel)
            return
        }
        
        for ingredient in ingredients {
            let ingredientLabel = UILabel()
            ingredientLabel.text = "• \(ingredient.name): \(ingredient.measurement)"
            ingredientLabel.font = .systemFont(ofSize: 14, weight: .regular)
            ingredientLabel.numberOfLines = 0
            contentView.addArrangedSubview(ingredientLabel)
        }
        
        let instructionTitle = UILabel()
        instructionTitle.text = "Instructions"
        instructionTitle.font = .systemFont(ofSize: 18, weight: .semibold)
        instructionTitle.numberOfLines = 0
        contentView.addArrangedSubview(instructionTitle)
 
        let instructionDescription = UILabel()
        instructionDescription.text = meal?.description
        instructionDescription.font = .systemFont(ofSize: 14, weight: .regular)
        instructionDescription.numberOfLines = 0 
        contentView.addArrangedSubview(instructionDescription)
    }
}

