//
//  MealCloud.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 06/12/24.
//

import Foundation

struct Ingredient:Identifiable, Codable{
    var id: UUID = .init()
    let name: String
    let measurement: String
}

struct MealCloud: Codable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strYoutube: String
    let ingredients: [Ingredient]
    
    struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
            self.intValue = nil
        }
        
        init?(intValue: Int) {
            return nil
        }
    }
}

extension MealCloud{
    func toMeal() -> Meal {
        Meal(
            id: self.idMeal,
            title: self.strMeal,
            description: self.strInstructions,
            from: self.strArea,
            image: self.strMealThumb,
            category: self.strCategory,
            ingredients: self.ingredients
        )
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode primary properties
        self.idMeal = try container.decode(String.self, forKey: .idMeal)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strCategory = try container.decode(String.self, forKey: .strCategory)
        self.strArea = try container.decode(String.self, forKey: .strArea)
        self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
        self.strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        self.strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube) ?? ""
        
        // Decode dynamic ingredients and measures
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var tempIngredients: [Ingredient] = []
        
        for i in 1...20 { // Adjust the range if the API uses a different number
            let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(i)")!
            let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(i)")!
            
            if let ingredient = try dynamicContainer.decodeIfPresent(String.self, forKey: ingredientKey),
               let measure = try dynamicContainer.decodeIfPresent(String.self, forKey: measureKey),
               !ingredient.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                
                let trimmedIngredient = ingredient.trimmingCharacters(in: .whitespacesAndNewlines)
                let trimmedMeasure = measure.trimmingCharacters(in: .whitespacesAndNewlines)
                
                let ingredientItem = Ingredient(name: trimmedIngredient, measurement: trimmedMeasure)
                tempIngredients.append(ingredientItem)
            }
        }
        
        self.ingredients = tempIngredients
    }
}
