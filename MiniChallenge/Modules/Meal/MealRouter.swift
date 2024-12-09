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
        let presenter = MealPresenter(
            view: view,
            router: router
        )
        
        view.presenter = presenter
        
        return view
    }
}
