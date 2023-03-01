//
//  openai_async_image_swiftui_exampleApp.swift
//
//  Created by Igor on 18.02.2023.
//

import SwiftUI
import openai_async_image_swiftui

@main
struct openai_async_image_swiftui_exampleApp: App {
   
    init(){
        initDefaultLoader()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
    
    private func initDefaultLoader() {
        let apiKey = "your API KEY"
        let endpoint = OpenAIImageEndpoint.get(with: apiKey)
        let loader = OpenAIDefaultLoader(endpoint: endpoint)
        OpenAIDefaultLoaderKey.defaultValue = loader
    }
}
