//
//  Meal.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 05/12/24.
//

struct Meal: Codable{
    let id: String
    let title: String
    let description: String
    let from: String
    let image: String
    let category: String
    
    init(id: String, title: String, description: String, from: String, image: String, category: String) {
        self.id = id
        self.title = title
        self.description = description
        self.from = from
        self.image = image
        self.category = category
    }
}
