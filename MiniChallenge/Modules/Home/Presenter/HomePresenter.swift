//
//  HomePresenter.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//

protocol HomePresenterProtocol: AnyObject{
    func viewDidLoad()
    func didSearch(query: String)
}

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        Task {
            do {
                let meals = try await interactor.fetchData(search: "Chicken")
                await MainActor.run {
                    view?.showMeals(meals)
                }
            } catch {
                await MainActor.run {
                    view?.showError("Failed to load meals")
                }
            }
        }
    }
    
    func didSearch(query: String) {
        Task {
            do {
                let meals = try await interactor.fetchData(search: query)
                await MainActor.run {
                    view?.showMeals(meals)
                }
            } catch {
                await MainActor.run {
                    view?.showError("Failed to load meals")
                }
            }
        }
    }
    
    func pushToDetail(meal: Meal) {
        router.pushToDetail(meal: meal)
    }
}

