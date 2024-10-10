//
//  RecipesAPIService.swift
//  GlobalCuisine
//
//  Created by Francisco Ozuna Diaz on 10/9/24.
//

import Foundation

protocol APIService {
    func fetchRecipes() async throws -> [String: [Recipe]]
}

class RecipesAPIService: APIService {
    private let baseUrl = "https://d3jbb8n5wk0qxi.cloudfront.net"
    private let happyEndpoint = "/recipes.json"
    private let malformedEndpoint = "/recipes-malformed.json"
    private let emptyEndpoint = "/recipes-empty.json"
    
    func fetchRecipes() async throws -> [String: [Recipe]] {
        guard let url = URL(string: baseUrl.appending(happyEndpoint)) else { throw RecipeAPIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw RecipeAPIError.invalidResponse
        }
        
        do {
            let recipes = try JSONDecoder().decode(RecipeAPIResponseModel.self, from: data).recipes
            let recipesByCuisine = Dictionary(grouping: recipes, by: \.cuisine)
            return recipesByCuisine
        } catch {
            throw RecipeAPIError.invalidData
        }
    }
}
