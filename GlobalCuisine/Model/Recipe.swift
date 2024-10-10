//
//  Recipe.swift
//  GlobalCuisine
//
//  Created by Francisco Ozuna Diaz on 10/9/24.
//

import Foundation

struct Recipe: Codable, Identifiable, Hashable {
    let cuisine: String
    let id: String
    let largePhotoURL: String
    let name: String
    let smallPhotoURL: String
    let sourceURL: String?
    let youtubeURL: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine
        case id = "uuid"
        case largePhotoURL = "photo_url_large"
        case name
        case smallPhotoURL = "photo_url_small"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
        
    static let sampleRecipesByCuisine: [String: [Recipe]] = [
        "American": [
            .init(
                cuisine: "American",
                id: "606f22ce-fcd1-434e-a6da-9571c0b2fc9b",
                largePhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/74aa9345-00ae-4178-9aa7-8fcee19af160/large.jpg",
                name: "Chocolate Raspberry Brownies",
                smallPhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/74aa9345-00ae-4178-9aa7-8fcee19af160/small.jpg",
                sourceURL: "https://www.bbcgoodfood.com/recipes/2121648/bestever-chocolate-raspberry-brownies",
                youtubeURL: "https://www.youtube.com/watch?v=Pi89PqsAaAg"
            ),
            .init(
                cuisine: "American",
                id: "f8b20884-1e54-4e72-a417-dabbc8d91f12",
                largePhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg",
                name: "Banana Pancakes",
                smallPhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg",
                sourceURL: "https://www.bbcgoodfood.com/recipes/banana-pancakes",
                youtubeURL: "https://www.youtube.com/watch?v=kSKtb2Sv-_U"
            )
        ],
        "French": [
            .init(
                cuisine: "French",
                id: "8925bfec-3ef5-4c56-a9d1-80e42654e0bf",
                largePhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/376f3377-c481-43cf-bcc6-c0befd612552/large.jpg",
                name: "Pear Tarte Tatin",
                smallPhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/376f3377-c481-43cf-bcc6-c0befd612552/small.jpg",
                sourceURL: "https://www.bbcgoodfood.com/recipes/4778/pear-tarte-tatin",
                youtubeURL: "https://www.youtube.com/watch?v=8U1tKWKDeWA"
            ),
            .init(
                cuisine: "French",
                id: "003cd03a-6e93-48ba-aa3d-0f53f40569ad",
                largePhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/76c7f8a1-9676-4cba-be3e-91bd53592d27/large.jpg",
                name: "Chocolate Souffle",
                smallPhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/76c7f8a1-9676-4cba-be3e-91bd53592d27/small.jpg",
                sourceURL: "https://www.bbcgoodfood.com/recipes/5816/hot-chocolate-souffls-with-chocolate-cream-sauce",
                youtubeURL: "https://www.youtube.com/watch?v=FWqfkUEWOTg"
            )
        ]
    ]
}


