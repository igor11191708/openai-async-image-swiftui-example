//
//  ContentView.swift
//  openai-async-image-swiftui-example
//
//  Created by Igor on 18.02.2023.
//

import openai_async_image_swiftui
import async_http_client
import SwiftUI

struct ContentView: View {
    
    @State var text: String = "Sun"

    @State var imageText: String = "Sun"

    var customImageTpl : some View{
        OpenAIAsyncImage(prompt: $imageText, size: .dpi1024){ state in
            switch state{
                case .loaded(let image) :
                image
                    .resizable()
                    .scaledToFill()
            case .loadError(let error) : Text(error.localizedDescription)
                case .loading : ProgressView()
            }
        }
    }
    
    var defaultImageTpl: some View{
        OpenAIAsyncImage(prompt: .constant("Sun"))
                       .frame(width: 125, height: 125)
                       .padding(.top, 75)
                       .padding(.trailing, 20)
    }
    
    var body: some View {
        VStack {
            HStack{
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


fileprivate struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal, 24)
            .background(
                .ultraThinMaterial
            )
            .clipShape(Capsule(style: .continuous))
    }
}

