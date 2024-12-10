//
//  RoundedTextFieldStyle.swift
//  openai-async-image-swiftui-example
//
//  Created by Igor on 26.11.24.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal, 24)
            .background(.ultraThinMaterial)
            .clipShape(Capsule(style: .continuous))
    }
}
