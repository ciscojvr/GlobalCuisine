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
    var recipesMicroservice: MicroserviceAPI
    
    init() {
        var recipesMicroservice = MicroserviceAPI(
            baseURL: "https://d3jbb8n5wk0qxi.cloudfront.net"
        )
        recipesMicroservice.addEndpoint(
            name: "recipes",
            path: "/recipes.json"
        )
        recipesMicroservice.addEndpoint(
            name: "malformedRecipes",
            path: "/recipes-malformed.json"
        )
        recipesMicroservice.addEndpoint(
            name: "emptyRecipes",
            path: "/recipes-empty.json"
        )
        self.recipesMicroservice = recipesMicroservice
    }
    
    func fetchRecipes() async throws -> [String: [Recipe]] {
        guard let url = recipesMicroservice.url(forEndpoint: "recipes") else { throw RecipeAPIError.invalidURL }
        
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
