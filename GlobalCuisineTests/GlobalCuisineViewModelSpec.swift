//
//  GlobalCuisineViewModelSpec.swift
//  GlobalCuisine
//
//  Created by Francisco Ozuna Diaz on 10/10/24.
//

import XCTest
@testable import GlobalCuisine

final class GlobalCuisineViewModelSpec: XCTestCase {
    var viewModel: GlobalCuisineViewModel!
    var mockService: RecipesAPIMockService!
    
    override func setUp() {
        super.setUp()
        mockService = RecipesAPIMockService(mockData: Recipe.sampleRecipesByCuisine)
        viewModel = GlobalCuisineViewModel(
            recipesByCuisine: [:],
            alert: .none,
            loadingState: .loading,
            apiService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testViewModelHasEmptyRecipes() {
        XCTAssertTrue(viewModel.isEmpty)
    }
    
    func testFetchRecipesUpdatesViewModel() async {
        await viewModel.fetchRecipes()
        XCTAssertFalse(viewModel.isEmpty)
        XCTAssertEqual(viewModel.loadingState, .loaded)
        XCTAssertNil(viewModel.alert)
        XCTAssertEqual(viewModel.recipesByCuisine.count, 2)
        XCTAssertEqual(viewModel.recipesByCuisine, Recipe.sampleRecipesByCuisine)
        
    }
    
    func testFetchRecipesThrowsInvalidUrlError() async {
        mockService = RecipesAPIMockService(error: RecipeAPIError.invalidURL)
        viewModel = GlobalCuisineViewModel(
            apiService: mockService
        )
        await viewModel.fetchRecipes()
        XCTAssertEqual(viewModel.loadingState, .failed)
        XCTAssertTrue(viewModel.recipesByCuisine.isEmpty)
        XCTAssertNotNil(viewModel.alert)
        XCTAssertEqual(viewModel.alert, AlertContext.invalidUrl)
    }
    
    func testFetchRecipesThrowsInvalidResponseError() async {
        mockService = RecipesAPIMockService(error: RecipeAPIError.invalidResponse)
        viewModel = GlobalCuisineViewModel(
            apiService: mockService
        )
        await viewModel.fetchRecipes()
        XCTAssertEqual(viewModel.loadingState, .failed)
        XCTAssertTrue(viewModel.recipesByCuisine.isEmpty)
        XCTAssertNotNil(viewModel.alert)
        XCTAssertEqual(viewModel.alert, AlertContext.invalidResponse)
    }
    
    func testFetchRecipesThrowsInvalidDataError() async {
        mockService = RecipesAPIMockService(error: RecipeAPIError.invalidData)
        viewModel = GlobalCuisineViewModel(
            apiService: mockService
        )
        await viewModel.fetchRecipes()
        XCTAssertEqual(viewModel.loadingState, .failed)
        XCTAssertTrue(viewModel.recipesByCuisine.isEmpty)
        XCTAssertNotNil(viewModel.alert)
        XCTAssertEqual(viewModel.alert, AlertContext.invalidData)
    }
    
    func testFetchRecipesThrowsURLNetworkError() async {
        mockService = RecipesAPIMockService(error: URLError.init(.notConnectedToInternet))
        viewModel = GlobalCuisineViewModel(
            apiService: mockService
        )
        await viewModel.fetchRecipes()
        XCTAssertEqual(viewModel.loadingState, .failed)
        XCTAssertTrue(viewModel.recipesByCuisine.isEmpty)
        XCTAssertNotNil(viewModel.alert)
    }
}

struct RecipesAPIMockService: APIService {
    var error: Error? = nil
    var mockData: [String: [Recipe]] = [:]
    
    func fetchRecipes() async throws -> [String : [Recipe]] {
        if let error  {
            throw error
        }
        return mockData
    }
}
