//
//  GlobalCuisineView.swift
//  GlobalCuisine
//
//  Created by Francisco Ozuna Diaz on 10/9/24.
//

import SwiftUI

struct GlobalCuisineView: View {
    @State private var viewModel = GlobalCuisineViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.loadingState {
                case .loading:
                    ProgressView()
                case .loaded:
                    if viewModel.isEmpty {
                        ContentUnavailableView("No recipes available at this time.", systemImage: "fork.knife.circle")
                    } else {
                        RecipesView(recipesByCuisine: viewModel.recipesByCuisine)
                    }
                case .failed:
                    ContentUnavailableView("Error retrieving recipes.\nPlease try again later.", systemImage: "xmark.circle")
                }
            }
            .navigationTitle("Global Cuisine")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Refresh Recipes") {
                        Task {
                            await viewModel.fetchRecipes()
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchRecipes()
        }
        .alert(item: $viewModel.alert) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    GlobalCuisineView()
}
