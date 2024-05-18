//
//  CustomFont.swift
//  RiveAnimation
//
//  Created by ebi igweze on 09/05/2024.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var textStyle: TextStyle
    
    var name: String {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3: return "Poppins Bold"
        case .body, .subheadline, .caption, .footnote:  return "Inter Regular"
        case .headline, .subheadline2, .caption2, .footnote2:  return "Inter SemiBold"
        }
    }
    
    var size: CGFloat {
        switch textStyle {
        case .largeTitle: 34
        case .title: 28
        case .title2: 24
        case .title3: 20
        case .body: 17
        case .headline: 17
        case .subheadline: 15
        case .subheadline2: 15
        case .footnote: 13
        case .footnote2: 13
        case .caption: 12
        case .caption2: 12
        }
    }
    
    var relative: Font.TextStyle {
        switch textStyle {
        case .largeTitle: .largeTitle
        case .title: .title
        case .title2: .title2
        case .title3: .title3
        case .body: .body
        case .headline: .headline
        case .subheadline: .subheadline
        case .subheadline2: .subheadline
        case .footnote: .footnote
        case .footnote2: .footnote
        case .caption: .caption
        case .caption2: .caption
        }
    }
    
    func body(content: Content) -> some View {
        content.font(.custom(name, size: size, relativeTo: .body))
    }
}

extension View {
    func customFont(_ textStyle: TextStyle) -> some View {
        modifier(CustomFont(textStyle: textStyle))
    }
}

enum TextStyle {
    case largeTitle
    case title
    case title2
    case title3
    case body
    case headline
    case subheadline
    case subheadline2
    case caption
    case caption2
    case footnote
    case footnote2
}
