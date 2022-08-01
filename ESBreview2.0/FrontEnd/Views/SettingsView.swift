//
//  SettingsView.swift
//  ESBreview
//
//  Created by Joel Kabura on 5/24/22.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var SeccionViewModel = SessionStore()
    @ObservedObject var viewModel = MessagesViewModel()
    
    var body: some View {
        VStack {
            Text("Welcome to settings ")
                .font(.title)
            
           Text(viewModel.username ?? "username")
            
    
            Spacer()
            
            Button(action: {
                SeccionViewModel.signOut()
            }, label: {
                Text("Sign Out")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color("color"))
            })
            Spacer()
        
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
