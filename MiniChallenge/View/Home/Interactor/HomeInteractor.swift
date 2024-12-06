//
//  HomeInteractor.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject{
    func fetchData(search: String) async throws -> [Meal]
}

class HomeInteractor: HomeInteractorProtocol{
    func fetchData(search: String) async throws -> [Meal]{
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(search)") else {
            return []
        }
        
        let (result,_) = try await URLSession.shared.data(from: url)
        let cloudData = try JSONDecoder().decode(MealResponse.self, from: result)
        let data = cloudData.meals.map{$0.toMeal()}
        
        return data
    }
}
