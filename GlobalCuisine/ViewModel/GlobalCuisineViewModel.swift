//
//  RecipeViewModel.swift
//  GlobalCuisine
//
//  Created by Francisco Ozuna Diaz on 10/9/24.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, loaded, failed
}

@Observable
class GlobalCuisineViewModel {
    var recipesByCuisine: [String: [Recipe]] = [:]
    var alert: AlertItem?
    var loadingState: LoadingState = .loading
    private var apiService: APIService
    
    init(
        recipesByCuisine: [String : [Recipe]] = [:],
        alert: AlertItem? = nil,
        loadingState: LoadingState = .loading,
        apiService: APIService = RecipesAPIService()
    ) {
        self.recipesByCuisine = recipesByCuisine
        self.alert = alert
        self.loadingState = loadingState
        self.apiService = apiService
    }
    
    var isEmpty: Bool {
        recipesByCuisine.isEmpty
    }
    
    func fetchRecipes() async {
        do {
            loadingState = .loaded
            recipesByCuisine = try await apiService.fetchRecipes()
        } catch {
            loadingState = .failed
            if let error = error as? RecipeAPIError {
                switch error {
                case .invalidURL:
                    alert = AlertContext.invalidUrl
                case .invalidResponse:
                    alert = AlertContext.invalidResponse
                case .invalidData:
                    alert = AlertContext.invalidData
                }
            } else {
                alert = AlertItem(
                    title: Text("Uh-oh!"),
                    message: Text("\(error.localizedDescription)"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
