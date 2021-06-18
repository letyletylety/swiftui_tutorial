//
//  tutorialApp.swift
//  tutorial
//
//  Created by 강태진 on 2021/06/11.
//

import SwiftUI

/// app 의 시작 지점
@main
struct tutorialApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
