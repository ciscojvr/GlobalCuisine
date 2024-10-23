//
//  MicroserviceAPI.swift
//  GlobalCuisine
//
//  Created by Francisco Ozuna Diaz on 10/22/24.
//

import Foundation

struct MicroserviceAPI {
    private let baseURL: String
    private var endpoints: [String: String] = [:]
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    mutating func addEndpoint(name: String, path: String) {
        endpoints[name] = path
    }
    
    func url(forEndpoint name: String, queryItems: [URLQueryItem]? = nil) -> URL? {
        guard let path = endpoints[name] else { return nil }
        
        var components = URLComponents(string: baseURL)
        components?.path = path
        
        if let queryItems {
            components?.queryItems = queryItems
        }
        
        return components?.url
    }
}

