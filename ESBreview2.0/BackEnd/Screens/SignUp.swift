//
//  SignUp.swift
//  FireBase_tutorial
//
//  Created by Joel Kabura on 5/17/22.
//

import SwiftUI


struct SignUp: View {
    @State var email = ""
    @State var password = ""
    @State var retypePassoword = ""
    
    
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var sessionSession = SessionStore()
    @ObservedObject var viewModel = MessagesViewModel()
    
  
    var body: some View {
        VStack{
            
            Spacer()
            Text("Register")
                .font(.title)
            

            
            
            TextField("Email",text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
            
            
            SecureField("Passowrd", text: $retypePassoword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
            
            SecureField("Retype Passowrd", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
            
            
            //Sign up
            
            Button(action: {
                
                if email.isEmpty || password.isEmpty {
                    ///
                }
            
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                sessionSession.signUp(email: email, password: password)
                
                presentationMode.wrappedValue.dismiss()
                
            }){
                Text("Sign Up")
                   
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(Color("color"))
            }
            .cornerRadius(10)
        
            Spacer()
        }
            
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
