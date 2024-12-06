//
//  HomeRouter.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//

import UIKit

protocol HomeRouterProtocol: AnyObject{
    func createModule() -> UIViewController
    func pushToDetail(meal: Meal) -> ()
}

final class HomeRouter: HomeRouterProtocol{
    var router: UINavigationController?
    
    func setupNavigationController(router: UINavigationController){
        self.router = router
    }
    
    func createModule() -> UIViewController {
        let router = self
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        
        view.presenter = presenter
        
        return view
    }
    
    func pushToDetail(meal: Meal){
        router?.pushViewController(MealViewController(meal: meal), animated: true)
    }
}
