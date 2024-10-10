//
//  AlertItem.swift
//  GlobalCuisine
//
//  Created by Francisco Ozuna Diaz on 10/9/24.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidUrl = AlertItem(title: Text("Invalid URL"),
                                      message: Text("Invalid url returned from server."),
                                      dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Invalid Response"),
                                           message: Text("Invalid response returned from server."),
                                           dismissButton: .default(Text("OK")))
    static let invalidData = AlertItem(title: Text("Invalid Data"),
                                       message: Text("Invalid data returned from server."),
                                       dismissButton: .default(Text("OK")))
}

extension AlertItem: Equatable {
    static func == (lhs: AlertItem, rhs: AlertItem) -> Bool {
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.message == rhs.message
    }
}
