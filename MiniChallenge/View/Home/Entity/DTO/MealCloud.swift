//
//  MealCloud.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//

struct MealCloud: Codable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
}

extension MealCloud{
    func toMeal()->Meal{
        Meal(
            id: self.idMeal,
            title: self.strMeal,
            description: self.strInstructions,
            from: self.strArea,
            image: self.strMealThumb,
            category: self.strCategory
        )
    }
}
