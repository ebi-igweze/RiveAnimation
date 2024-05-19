//
//  SideMenuView.swift
//  RiveAnimation
//
//  Created by ebi igweze on 18/05/2024.
//

import SwiftUI
import RiveRuntime

struct SideMenuView: View {
    @State var selectedMenu: MenuType = .home
    @State var isDarkMode: Bool = false

    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.12))
                    .mask(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Menu To")
                        .customFont(.title2)
                    
                    Text("UI Designer")
                        .customFont(.subheadline)
                        .opacity(0.8)
                    
                }
                Spacer()
            }
            .padding()
            
            
            Text("BROWSE")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.6)
            
            ForEach(browseMenuItems) { item in
                MenuRowView(menu: item, selectedMenu: $selectedMenu)
            }
            
            
            Text("HISTORY")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.6)
            
            ForEach(historyMenuItems) { item in
                MenuRowView(menu: item, selectedMenu: $selectedMenu)
            }
            
            Spacer()
            
            HStack(spacing: 14) {
                darkMode.icon.view()
                    .frame(width: 32, height: 32)
                    .opacity(0.6)
                    .onChange(of: isDarkMode) { old, new in
                        if new {
                            darkMode.icon.setInput("active", value: true)
                        } else {
                            darkMode.icon.setInput("active", value: false)
                        }
                    }
                Text(darkMode.text)
                    .customFont(.headline)
                Toggle("", isOn: $isDarkMode)
            }
            .padding(20)
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {
    SideMenuView()
}


