//
//  HtmlText.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//
import SwiftUI

struct HtmlText: View {
    
    let text: String
    let font: Font
    
    init(_ content: String, font: Font = .body) {
        self.text = content
        self.font = font
    }
    
    private var plainText: String {
        guard let data = text.data(using: .utf8) else { return text }
        guard let nsAttributedString = try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        ) else { return text }
        return nsAttributedString.string
    }
    
    var body: some View {
        Text(plainText)
            .font(font)
    }
    
}