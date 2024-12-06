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
    let viewControllerView = HomeView()
    var presenter: HomePresenter?
    
    override func loadView() {
        self.view = viewControllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        viewControllerView.searchBarComponent.didSearch = {query in
            
            self.presenter?.didSearch(query: query)
        }
        
        viewControllerView.filterMenuComponent.didFilter = {query in
            let prevData = self.viewControllerView.cardMenuComponent.unfilteredData
            if(query.count == 0){
                self.viewControllerView.cardMenuComponent.data = prevData
            }else{
                let filteredData = prevData.filter{ query.contains($0.from)}
                self.viewControllerView.cardMenuComponent.data = filteredData
            }
        }
    }
    
    func showMeals(_ meals: [Meal]) {
        viewControllerView.cardMenuComponent.data = meals
        viewControllerView.cardMenuComponent.unfilteredData = meals
    }
    
    func showError(_ message: String) {
        print(message)
    }
}

#Preview{
    HomeView()
}
