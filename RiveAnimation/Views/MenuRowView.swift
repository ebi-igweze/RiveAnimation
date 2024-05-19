//
//  MenuRowView.swift
//  RiveAnimation
//
//  Created by ebi igweze on 19/05/2024.
//

import SwiftUI
import RiveRuntime


struct MenuRowView: View {
    
    var menu: MenuItem
    @Binding var selectedMenu: MenuType
    
    
    var body: some View {
        
        let isSelected = selectedMenu == menu.menu
        
        VStack {
            Rectangle()
                .frame(height: 1)
                .opacity(0.2)
                .padding(.horizontal)
            
            HStack(spacing: 14) {
                menu.icon.view()
                    .frame(width: 32, height: 32)
                    .opacity(0.8)
                
                Text(menu.text)
                    .customFont(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.blue)
                    .frame(maxWidth: isSelected ? .infinity : 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
            )
            .background(Color("Background 2"))
            .onTapGesture {
                menu.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    menu.icon.setInput("active", value: false)
                }
                withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
                    selectedMenu = menu.menu
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    MenuRowView(menu: browseMenuItems[0], selectedMenu: .constant(.home))
}


struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var menu: MenuType
    var icon: RiveViewModel
}


enum MenuType: String  {
    case home
    case search
    case favorites
    case help
    case history
    case notifications
    case darkMode
}


var browseMenuItems = [
    MenuItem(
        text: "Home",
        menu: .home,
        icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    ),
    MenuItem(
        text: "Search",
        menu: .search,
        icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH")
    ),
    MenuItem(
        text: "Favorites",
        menu: .favorites,
        icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR")
    ),
    MenuItem(
        text: "Help",
        menu: .help,
        icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT")
    ),
    
]



var historyMenuItems = [
    MenuItem(
        text: "History",
        menu: .history,
        icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER")
    ),
    MenuItem(
        text: "Notifications",
        menu: .notifications,
        icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL")
    )
]

var darkMode = MenuItem(
    text: "Dark Mode",
    menu: .darkMode,
    icon: RiveViewModel(fileName: "icons", stateMachineName: "SETTINGS_Interactivity", artboardName: "SETTINGS")
)
