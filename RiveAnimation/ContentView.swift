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
        // close the button
        var _ = menuButton.setInput("isOpen", value: isOpen)
        
        ZStack {
            Color("Background 2")
                .ignoresSafeArea()
            
            SideMenuView()
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
                .rotation3DEffect(
                    .degrees(isOpen ? 0 : 30),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            
            
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
            .mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
            .rotation3DEffect(
                .degrees(isOpen ? 30 : 0),
                axis: (x: 0.0, y: -1.0, z: 0.0)
            )
            .offset(x: isOpen ? 265 : 0)
            .scaleEffect(isOpen ? 0.9: 1)
            .ignoresSafeArea()
            
            
            menuButton.view()
                .frame(width: 44, height: 44)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 216 : 0)
                .onTapGesture {
                    menuButton.setInput("isOpen", value: isOpen)
                    
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
                }
                
            TabBarView()
        }
    }
}

#Preview {
    ContentView()
}
