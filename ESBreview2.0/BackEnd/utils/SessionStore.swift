//
//  SessionStore.swift
//  FireBase_tutorial
//
//  Created by Joel Kabura on 5/14/22.
//
import Swift
import Foundation
import FirebaseAuth

struct User {
    var uid: String
    var email: String
    
    
}

class SessionStore: ObservableObject {
    @Published var session: User?
    @Published var isAnon: Bool = false
    // is anonymous
    var handle: AuthStateDidChangeListenerHandle?
    //its a variable so we could later on detach the listener when were done with the view
    
    //add a reference to the firbase class
    let authRef = Auth.auth()
    
    func listen() {
        //when we class listen it will attach a listener the authenication state and fire base will use this listener to send updates when it changes
        handle = authRef.addStateDidChangeListener({(auth, user) in
            if let user = user {
                self.isAnon = false
                self.session = User(uid: user.uid, email: user.email!)
            } else {
                self.isAnon = true
                self.session = nil
            }
            //so whenevery the authentication state changes firebase executes the handle function and it passes in auth and user, if user is defined, it means that the user is logged in and we set isnt on false so the user isnt anonymous. else if the user if not there which means they're not authenticated we set isnt on to true
        })
    }
    
    func signIn(email: String, password: String) {
        authRef.signIn(withEmail: email, password: password)
    }
    
    func signUp(email: String, password: String) {
        authRef.createUser(withEmail: email, password: password)
    }
    
   @discardableResult func signOut () -> Bool {
        do {
            try authRef.signOut()
            self.session = nil
            self.isAnon = true
            return true
        } catch {
            return false
        }
    }
    // this fucnc is resposnsible for unmounting the authenication state listener
    func umbind() {
        if let handle = handle {
            authRef.removeStateDidChangeListener(handle)
        }
    }
    
}
