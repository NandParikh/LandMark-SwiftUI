//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Nand Parikh on 21/02/21.
//

import SwiftUI
//Handling User Input https://developer.apple.com/tutorials/swiftui/handling-user-input#introduction
//Complex interface https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces
//Page View Controller https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit


@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
