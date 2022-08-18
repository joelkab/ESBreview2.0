//
//  ContentView.swift
//  ESBreview2.0
//
//  Created by Joel Kabura on 6/1/22.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var sessionStore = SessionStore()
    @ObservedObject var viewModel = MessagesViewModel()
    
    
    init(){
        sessionStore.listen()
    }
    
@ViewBuilder var body: some View {
        TabView {
            homeviewtest()
                .tabItem {
                    Label("Home", systemImage: "cart.circle.fill")
                }
            Messages(chatroom: Chatroom(id: "1010", title: "hello", joinCode: 10))
                .fullScreenCover(isPresented: $sessionStore.isAnon, content: {
                    Login()
                })
                .tabItem {
                    Label("Community", systemImage: "person.3")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "person.crop.circle")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
