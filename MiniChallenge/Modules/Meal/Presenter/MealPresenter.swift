//
//  MealPresenter.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//

import UIKit

protocol MealPresenterProtocol: AnyObject{
    func backToHome()
}

class MealPresenter: MealPresenterProtocol{
    weak var view: MealViewProtocol?
    var router: MealRouterProtocol
    
    init(
        view: MealViewProtocol,
        router: MealRouterProtocol
    ) {
        self.view = view
        self.router = router
    }
    
    func backToHome() {
        router.router?.popViewController(animated: true)
    }
}


