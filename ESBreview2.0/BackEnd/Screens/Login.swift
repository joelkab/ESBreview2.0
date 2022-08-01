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
                    
                    Image("person1")
                        .resizable()
                        .scaledToFit()
                        
                    
                    
                    Text("Welcome")
                        .font(.title)
                    
                    HStack {
                    Image(systemName: "envelope")
                    TextField("Email",text: $email)
                        
                    }
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .frame(height: 60)
                    .cornerRadius(8)
                   
                    HStack {
                        Image(systemName: "lock")
                    SecureField("Passowrd", text: $password)
                        
                       
                    }
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .cornerRadius(8)
                    .frame(height: 60)
                    
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
            .foregroundColor(Color("color"))
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
