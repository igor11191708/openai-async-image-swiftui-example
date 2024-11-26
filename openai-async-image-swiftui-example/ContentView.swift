//
//  ContentView.swift
//  openai-async-image-swiftui-example
//
//  Created by Igor on 18.02.2023.
//

import openai_async_image_swiftui
import SwiftUI

struct ContentView: View {
    
    @State var text: String = "Sun"
    
    @State var imageText: String = "Sun"

    var customImageTpl: some View {
        OpenAIAsyncImage(prompt: $imageText, size: .dpi1024) { state in
            switch state {
                case .loaded(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .loadError(let error):
                    TextWithLinks(inputString: error.localizedDescription)
                        .padding()
                case .loading:
                    ProgressView()
            }
        }
    }
    
    var defaultImageTpl: some View {
        OpenAIAsyncImage(prompt: .constant("Sun"))
            .frame(width: 125, height: 125)
            .padding(.top, 75)
            .padding(.trailing, 20)
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                defaultImageTpl
            }
            Spacer()
            TextField("Enter text", text: $text)
                .textFieldStyle(RoundedTextFieldStyle())
                .previewLayout(.sizeThatFits)
                .padding(.bottom, 50)
                .padding(.horizontal)
                .autocorrectionDisabled(true)
                .onSubmit {
                    imageText = text
                }
        }
        .background(customImageTpl)
        .ignoresSafeArea()
    }
}
