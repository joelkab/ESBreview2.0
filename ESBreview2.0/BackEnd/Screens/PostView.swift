//
//  PostView.swift
//  FireBase_tutorial
//
//  Created by Joel Kabura on 5/19/22.
//

import SwiftUI

struct PostView: View {
    let chatroom: Chatroom
    @State var messageField = "Please enter Text"
    @Environment(\.presentationMode) var presentationMode
    @State var showingSheet = false
    @ObservedObject var SeccionViewModel = SessionStore()
    @ObservedObject var viewModel = MessagesViewModel()
    @State var shouldShowImagePicker = false
    
    @State var image: UIImage?
    
    init(chatroom: Chatroom) {
        self.chatroom = chatroom
        viewModel.fetchData(docId: chatroom.id)
    }
    var body: some View {
        
        VStack(alignment: .trailing) {
            HStack {
                
                Button(action: {shouldShowImagePicker.toggle()
                    
                    
                }){
                    
                    Image(systemName: "photo.fill")
                        .font(.title)
                    
                        .disabled(self.messageField.isEmpty)
                }
                
                
                
                Button(action: {viewModel.sendMessage(messageContent: messageField, docId: chatroom.id)
                   // SeccionViewModel.persistImageToStorage()
                    presentationMode.wrappedValue.dismiss()
                    
                    
                }){
                    
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .padding()
                        .disabled(self.messageField.isEmpty)
                }
            }
                Spacer()
                
                VStack {
                    
                    if let image = self.image {
                    Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    
                    
                    }
                    TextEditor(text: $messageField)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 250)
                        .border(Color.black, width: 1)
        }
            
        Spacer()
            
        }

        .background(Color("color"))
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
            ImagePicker(image: $image)
        }

}
}
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(chatroom: Chatroom(id: "1010", title: "hello", joinCode: 10))
    }
}
