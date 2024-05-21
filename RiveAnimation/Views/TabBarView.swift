//
//  TabBarView.swift
//  RiveAnimation
//
//  Created by ebi igweze on 12/05/2024.
//

import SwiftUI
import RiveRuntime

struct TabItem: Identifiable {
    var id = UUID()
    var tab: Tab
    var icon: RiveViewModel
}

enum Tab: String {
    case chat
    case search
    case timer
    case bell
    case user
}

struct TabBarView: View {
    @AppStorage("SelectedTab") var selectedTab: Tab = .chat
    
    var body: some View {
        
        VStack {
            Spacer()
            
            HStack {
                content
            }
            .padding(12)
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .shadow(color: Color("Background 2"), radius: 20, x: 0, y: 20)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .stroke(
                        .linearGradient(
                            colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing
                        )
                    )
            )
            .padding(.horizontal, 24)
        }
    }
    
    var content: some View {
        ForEach(tabIcons) { tabItem in
            let isSelectedTab = tabItem.tab == selectedTab
            Button(action: {
                tabItem.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        tabItem.icon.setInput("active", value: false)
                    }
                    withAnimation {
                        selectedTab = tabItem.tab
                    }
                }, label: {
                    tabItem.icon.view()
                        .frame(height: 36)
                        .opacity(isSelectedTab ? 1 : 0.5)
                        .background(
                            VStack {
                                RoundedRectangle(cornerRadius: 2)
                                    .frame(width: 20, height: 4)
                                    .offset(y: -4)
                                    .opacity(isSelectedTab ? 1 : 0)
                                
                                Spacer()
                            }
                        )
                })
        }
    }
}

let tabIcons = [
    TabItem(tab: .chat, icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT")),
    TabItem(tab: .search, icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH")),
    TabItem(tab: .timer, icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER")),
    TabItem(tab: .bell, icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL")),
    TabItem(tab: .user, icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"))
]

#Preview {
    TabBarView()
}
