//
//  TextWithLinks.swift
//  openai-async-image-swiftui-example
//
//  Created by Igor  on 07.07.24.
//

import SwiftUI

import SwiftUI

struct TextWithLinks: View {
    let inputString: String
    var lineSpacing: CGFloat = 8 // Customize the line spacing as needed
    
    var body: some View {
        // Detect and split the input string into parts (text and links)
        let parts = detectAndSplitLinks(from: inputString)
        // Parse the parts and apply line spacing
        return parseString(parts: parts)
            .lineSpacing(lineSpacing)
    }
    
    /// Parses the parts of the string and wraps them in appropriate SwiftUI views.
    /// - Parameter parts: An array of strings containing text and links.
    /// - Returns: A view containing the parsed text and links.
    @ViewBuilder
    private func parseString(parts: [String]) -> some View {
        VStack(alignment: .leading, spacing: lineSpacing) {
            ForEach(parts.indices, id: \.self) { index in
                let part = parts[index]
                // Check if the part is a link
                if part.starts(with: "http://") || part.starts(with: "https://") {
                    if let url = URL(string: part) {
                        Link(part, destination: url) // Wrap the link in a Link view
                    }
                } else {
                    Text(part) // Wrap the text in a Text view
                }
            }
        }
    }
}

/// Detects HTTP links in a string and splits the string into an array of text and links.
/// - Parameter input: The input string containing text and HTTP links.
/// - Returns: An array of strings with text and links separated.
fileprivate func detectAndSplitLinks(from input: String) -> [String] {
    // Define the regular expression pattern for HTTP/HTTPS links
    let regex = try! NSRegularExpression(pattern: "https?://[a-zA-Z0-9./?=_-]+")
    let nsString = input as NSString
    let results = regex.matches(in: input, range: NSRange(location: 0, length: nsString.length))
    
    var parts: [String] = []
    var lastRange = NSRange(location: 0, length: 0)
    
    // Iterate over the results of the regex matches
    for result in results {
        if result.range.location > lastRange.location + lastRange.length {
            // Add the text before the link
            let textRange = NSRange(location: lastRange.location + lastRange.length, length: result.range.location - (lastRange.location + lastRange.length))
            parts.append(nsString.substring(with: textRange))
        }
        // Add the link
        parts.append(nsString.substring(with: result.range))
        lastRange = result.range
    }
    
    // Add the remaining text after the last link
    if lastRange.location + lastRange.length < nsString.length {
        let textRange = NSRange(location: lastRange.location + lastRange.length, length: nsString.length - (lastRange.location + lastRange.length))
        parts.append(nsString.substring(with: textRange))
    }
    
    return parts
}
