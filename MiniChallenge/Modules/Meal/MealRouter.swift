//
//  MealRouter.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//

import UIKit

protocol MealRouterProtocol: AnyObject{
    var router: UINavigationController? { get }
    func createModule() -> UIViewController
}

final class MealRouter: MealRouterProtocol{
    var router: UINavigationController?
    
    func setupNavigationController(router: UINavigationController){
        self.router = router
    }
    
    func createModule() -> UIViewController {
        let router = self
        let view = MealViewController()
        let interactor = MealInteractor()
        let presenter = MealPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        
        view.presenter = presenter
        
        return view
    }
}
