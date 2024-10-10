//
//  RecipesView.swift
//  GlobalCuisine
//
//  Created by Francisco Ozuna Diaz on 10/9/24.
//

import Kingfisher
import SwiftUI

struct RecipesView: View {
    let recipesByCuisine: [String: [Recipe]]
    
    var body: some View {
        List {
            ForEach(recipesByCuisine.keys.sorted(), id: \.self) { cuisine in
                Section {
                    ForEach(recipesByCuisine[cuisine]!, id: \.self) { recipe in
                        HStack {
                            KFImage(URL(string: recipe.largePhotoURL))
                                .placeholder {
                                    Image(systemName: "fork.knife")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                }
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            VStack(alignment: .leading) {
                                Text(recipe.name)
                            }
                        }
                    }
                } header: {
                    Text(cuisine)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    RecipesView(recipesByCuisine: Recipe.sampleRecipesByCuisine)
}
