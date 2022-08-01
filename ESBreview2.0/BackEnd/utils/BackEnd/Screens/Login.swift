//
//  Login.swift
//  FireBase_tutorial
//
//  Created by Joel Kabura on 5/14/22.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    
    @State var password = ""
    @State  var showingSheet = false
    @ObservedObject var sessionSession = SessionStore()
    @ObservedObject var viewModel = MessagesViewModel()
    // @Binding var show : Bool
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            GeometryReader{_ in
                
                
                
                VStack{
                    Spacer()
                    Text("Welcome")
                        .font(.title)
                    
                    TextField("email",text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                    
                    
                    TextField("Passowrd", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                    
                    //login
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        sessionSession.signIn(email: email, password: password)
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                            .background(Color("color"))
                    }
                    .cornerRadius(10)
                    
                    
                    //Sign up
                    Spacer()
                }
                
            }
            
            Button("Register") {
                showingSheet.toggle()
            }
            .padding()
            .sheet(isPresented: $showingSheet) {
                SignUp()
                
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
