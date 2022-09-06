
//  PostView.swift
//  FireBase_tutorial
//
//  Created by Joel Kabura on 5/19/22.
//

import SwiftUI
import Kingfisher
struct PostView: View {
    let chatroom: Chatroom
    @State var messageField = "Please enter Text"
    @Environment(\.presentationMode) var presentationMode
    @State var showingSheet = false
    @ObservedObject var SeccionViewModel = SessionStore()
    @ObservedObject var viewModel = MessagesViewModel()
    @State var shouldShowImagePicker = false
    @State var boardname: String = ""
    
    @State var image: UIImage?
    
    @State var images: [UIImage] = []
    
    private let widthImage = (UIScreen.main.bounds.size.width - 20) / 3
    
    
    
    init(chatroom: Chatroom) {
        self.chatroom = chatroom
        viewModel.fetchData(docId: chatroom.id)
    }
    @ViewBuilder var body: some View {
        
        VStack(alignment: .trailing) {
            HStack {
                
                Button(action: {shouldShowImagePicker.toggle()
                    
                    
                }){
                    
                    Image(systemName: "photo.fill")
                        .foregroundColor(.white)
                        .font(.title)
                    
                        .disabled(self.messageField.isEmpty)
                }
                
                
                
                Button(action: {
                    
                    
                    // SeccionViewModel.persistImageToStorage()
                     
                     // here we upload images to fireBase using this class
                     // you can start a loading animation here
                     FireBaseUpload.shared.startUploading(images: images, completion: {
                         // this part of the code called after finish uploading
                         // you can stop the animation here
                         
                         viewModel.sendMessage(messageContent: messageField, docId: chatroom.id, Boardname: boardname)
                         
                         UserDefaults.standard.removeObject(forKey: "image_url")
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
                    
                    
                    
                    
                    
                }){
                    
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                        .disabled(self.messageField.isEmpty)
                }
            }
                Spacer()
                
                VStack {
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            
                             ForEach(images, id: \.self) { image in
                                 
                                 
                                 
                                 Image(uiImage: image)
                                 .resizable()
                                 
                                 .scaledToFill()
                                 .frame(width: widthImage, height: widthImage)
                                
                             }
                            
                         }
                    }
                    
                    .frame(height: widthImage + 20)
                    
                    
                    .onChange(of: image) { img in
                        guard images.count < 1, let data = img else { return }
                        images.append(data)
                    }
                    
//                    if let image = self.image {
//                    Image(uiImage: image)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 128, height: 128)
//
//
//                    }
                    
                    TextField("Company", text: $boardname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                       ///here
                    
                    TextEditor(text: $messageField)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(height: 250)
                        
        }
            
        Spacer()
            
        }

        .background(Color("color"))
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
            ImagePicker(image: $image)
        }

}
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(chatroom: Chatroom(id: "1010", title: "hello", joinCode: 10))
    }
}
