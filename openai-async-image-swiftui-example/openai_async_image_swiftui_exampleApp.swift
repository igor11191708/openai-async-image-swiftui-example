//
//  openai_async_image_swiftui_exampleApp.swift
//
//  Created by Igor on 18.02.2023.
//

import SwiftUI
import openai_async_image_swiftui

@main
struct openai_async_image_swiftui_exampleApp: App {
   
    @State private var defaultLoader: OpenAIDefaultLoader

    init() {
        // WARNING: Do not hardcode API keys directly in your source code.
        // This is just an example. Use secure storage like Keychain instead.
        let apiKey = "Your APIKey"
        let endpoint = OpenAIImageEndpoint.get(with: apiKey)
        _defaultLoader = State(initialValue: OpenAIDefaultLoader(endpoint: endpoint))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.openAIDefaultLoader, defaultLoader)
                .preferredColorScheme(.dark)
        }
    }
}

// WARNING: Hardcoding API keys in the source code is insecure.
// Consider using a secure method such as Apple Keychain to store and retrieve sensitive information.
