//
//  ContentView.swift
//  RiveAnimation
//
//  Created by ebi igweze on 28/04/2024.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("SelectedTab") var selectedTab: Tab = .chat
    let menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine")
    
    var body: some View {
        
        ZStack {
            switch selectedTab {
            case .chat:
                Text("CHAT")
            case .search:
                Text("SEARCH")
            case .timer:
                Text("TIMER")
            case .bell:
                Text("BELL")
            case .user:
                Text("USER")
            }
            
            menuButton.view().onTapGesture {
                menuButton.setInput("isOpen", value: true)
            }
                
            TabBarView()
        }
    }
}

#Preview {
    ContentView()
}
