//
//  Messages.swift
//  FireBase_tutorial
//
//  Created by Joel Kabura on 5/15/22.
//

import SwiftUI



struct Messages: View {
    
    let chatroom: Chatroom
    @ObservedObject var viewModel = MessagesViewModel()
    @ObservedObject var SeccionViewModel = SessionStore()
    @State var messageField = ""
    @State var showingSheet = false
    
    
    init(chatroom: Chatroom) {
        self.chatroom = chatroom
        viewModel.fetchData(docId: chatroom.id)
    }
    var body: some View {
            VStack() {
        
                HStack {
                    Text("Posts")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer(minLength: 0)
                    
                    Button(action: {showingSheet.toggle()
                        
                    }){
                        
                        Image(systemName: "square.and.pencil")
                            .font(.title)
                    }
                    .padding()
                    .sheet(isPresented: $showingSheet) {
                        PostView(chatroom: Chatroom(id: "1010", title: "hello", joinCode: 10))
                    }
                }
               
                VStack(alignment: .trailing) {
                    
                    Button(action: {
                        SeccionViewModel.signOut()
                    }, label: {
                        Text("Sign Out")
                            .foregroundColor(Color.blue)
                    })
                    
                }
                VStack(alignment: .leading){
                    
                    ScrollView(){
                    
                        ForEach(viewModel.messages) { messages in
                        HStack{
                            VStack {
                                
                          
                                
                            Text(messages.content)
                                .padding()
                            Spacer()
                        }
                        }
                    }
                }
                }
            }
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages(chatroom: Chatroom(id: "1010", title: "hello", joinCode: 10))
    }
}
