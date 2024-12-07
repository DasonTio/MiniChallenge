//
//  CollectionView.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 04/12/24.
//
// HomeView.swift
import UIKit

protocol HomeViewProtocol: AnyObject{
    func showMeals(_ meals: [Meal])
    func showError(_ message: String)
}

class HomeViewController: UIViewController, HomeViewProtocol{
    let scrollView: UIScrollView = .init()
    let contentView: UIView = .init()
    let searchBarComponent: SearchBarComponent = .init()
    let filterMenuComponent: FilterMenuComponent = .init()
    let cardMenuComponent: CardMenuComponent = .init()
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViews()
        view.backgroundColor = .white
        
        self.searchBarComponent.didSearch = {query in
            self.presenter?.didSearch(query: query)
        }
        
        self.filterMenuComponent.didFilter = {query in
            let prevData = self.cardMenuComponent.unfilteredData
            if(query.count == 0){
                self.cardMenuComponent.data = prevData
            }else{
                let filteredData = prevData.filter{ query.contains($0.from)}
                self.cardMenuComponent.data = filteredData
            }
        }
        
        self.cardMenuComponent.didClickCard = {meal in
            self.presenter?.pushToDetail(meal: meal)
        }
    }
    
    func showMeals(_ meals: [Meal]) {
        self.cardMenuComponent.data = meals
        self.cardMenuComponent.unfilteredData = meals
        
    }
    
    func showError(_ message: String) {
        print(message)
    }
    
    private func setupViews(){
        view.addSubview(scrollView)

        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
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

#Preview{
    HomeRouter().createModule()
}
