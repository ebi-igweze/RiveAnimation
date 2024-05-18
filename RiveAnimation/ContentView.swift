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
    @State var isOpen = false
    let menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine")
    
    
    
    var body: some View {
        
        ZStack {
            Group {
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("SEARCH")
                case .timer:
                    Text("TIMER")
                case .bell:
                    Text("BELL")
                case .user:
                    Text("USER")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 114)
            }
            .ignoresSafeArea()
            
            
            // close the button
            let _ = menuButton.setInput("isOpen", value: true)
            menuButton.view()
                .frame(width: 44, height: 44)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .onTapGesture {
                    menuButton.setInput("isOpen", value: isOpen)
                    isOpen.toggle()
                }
                
            TabBarView()
        }
    }
}

#Preview {
    ContentView()
}
