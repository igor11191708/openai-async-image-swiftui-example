//
//  openai_async_image_swiftui_exampleApp.swift
//
//  Created by Igor on 18.02.2023.
//

import SwiftUI
import openai_async_image_swiftui

@main
struct openai_async_image_swiftui_exampleApp: App {
    
    @Environment(\.openAIDefaultLoader) var loader : OpenAIDefaultLoader
    
    var body: some Scene {
        
        let apiKey = "your API KEY"
        let endpoint = OpenAIImageEndpoint.get(with: apiKey)
        let loader = OpenAIDefaultLoader(endpoint: endpoint)
        
        WindowGroup {
            ContentView()
                .environment(\.openAIDefaultLoader, loader)
                .preferredColorScheme(.dark)
        }
    }
}
