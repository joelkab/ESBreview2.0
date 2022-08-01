//
//  MessagesViewModel.swift
//  FireBase_tutorial
//
//  Created by Joel Kabura on 5/15/22.
//


import Firebase
import SwiftUI
import FirebaseFirestore
import FirebaseStorage


struct Message: Codable, Identifiable {
    var id: String?
    var content: String
    var name: String
    var pic: String
    
    
    
}

class MessagesViewModel: ObservableObject {
    @Published var messages : [Message] = []
    @Published var firebaseUpload = FireBaseUpload()
   @Published var picurl = ""
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    private let uid = Auth.auth().currentUser?.uid
    @State  var showingSheet = false
    @State var username = Auth.auth().currentUser?.email
    
    
    
    
    
    
    
    
    func sendMessage(messageContent: String, docId: String) {
        
        let imageUrl = UserDefaults.standard.url(forKey: "image_url")
        let imageString = imageUrl?.absoluteString
        
        if (user != nil) {
//
            db.collection("chatrooms").document(docId).collection("messages").addDocument(data: [
                                                                                            "sentAt": Date(),
                                                                                            "displayName": user!.email as Any,
                                                                                            "imageUrl": imageString as Any,
                                                                                            "content": messageContent,

                                                                                            "sender": user!.uid])
            print("this is the secound url: \(picurl as Any)")
        }
    }
    
    func fetchData(docId: String) {
        if (user != nil) {
            db.collection("chatrooms").document(docId).collection("messages").order(by: "sentAt", descending: false).addSnapshotListener({ [self](snapshot, error) in
                guard let documents = snapshot?.documents else {
                    print("no documents")
                    return
                }
                
                self.messages = documents.map { docSnapshot -> Message in
                    let data = docSnapshot.data()
                    let docId = docSnapshot.documentID
                   
                    let content = data["content"] as? String ?? ""
                    let displayName = data["displayName"] as? String ?? ""
                    let pic = data["imageUrl"] as? String ?? ""
                    return Message(id: docId, content: content, name: displayName, pic: pic)
                    
                }
            })
        }
    }
    func deletingPost() {
        
        if let documentId = user?.uid {
        db.collection("content").document(documentId).delete() { err in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
        }
        }
    }
}
