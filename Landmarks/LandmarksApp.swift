//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Shawn Williams on 12/23/20.
//

import SwiftUI

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
