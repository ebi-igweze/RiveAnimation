//
//  CustomTextField.swift
//  RiveAnimation
//
//  Created by ebi igweze on 10/05/2024.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var icon: String
    
    func body(content: Content) -> some View {
        content.padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.1))
            )
            .overlay(
                Image(icon)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                
            )
    }
}

extension View {
    func customTextField(icon: String) -> some View {
        return modifier(CustomTextField(icon: icon))
    }
}
