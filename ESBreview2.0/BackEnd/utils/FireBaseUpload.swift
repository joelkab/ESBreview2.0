//
//  FireBaseUpload.swift
//  ESBreview2.0
//
//  Created by med hajajate on 4/6/2022.
//

import Foundation
import Firebase
import FirebaseStorage
import SwiftUI
import UIKit




class FireBaseUpload: NSObject, ObservableObject {
    

    
    
   

 
    
    
    /// Singleton instance
    
    static let shared: FireBaseUpload = FireBaseUpload()
    
    
    
    
        //@Published var picurl = UserDefaults.standard.data(forKey: "savedURL")
    @Published var picurl = URL(string: "")
    
    /// Path
    let kFirFileStorageRef = Storage.storage().reference().child("Files")
    let storage = Storage.storage().reference()
    
    /// Current uploading task
    var currentUploadTask: StorageUploadTask?
    
    /// Here is the completion block
    typealias FileCompletionBlock = () -> Void
    var block: FileCompletionBlock?

    func upload(data: Data,
                withName fileName: String,
                block: @escaping (_ url: String?) -> Void) {
        
        // Create a reference to the file you want to upload
        //let fileRef = kFirFileStorageRef.child("Files")
        
        /// Start uploading
        upload(imagedata: data, withName: fileName, atPath: kFirFileStorageRef) { (url) in
            block(url)
            
            
            
        }
    }
    
    func upload(imagedata: Data,
                withName fileName: String,
                atPath path:StorageReference,
                block: @escaping (_ url: String?) -> Void) {
        
        // Upload the file to the path
        self.currentUploadTask = path.putData(imagedata, metadata: nil) { (metadata, error) in
            guard metadata != nil else {
                // Uh-oh, an error occurred!
                block(nil)
                return
            }
            // Metadata contains file metadata such as size, content-type.
            //let size = metadata.size
            // You can also access to download URL after upload.
            
            
            path.downloadURL { (url, error) in
                
                UserDefaults.standard.set(url, forKey: "image_url")
                
                guard let downloadURl = url else {
                    
                    
                    
                    print("Uh-oh, an error occurred!")
                    block(nil)
                    return
                }
                
               // self.picurl = downloadURl
                
               
                
                
                block(downloadURl.absoluteString)
                print(downloadURl)
                
            }
            
           
            
            
            
            
            
        }
    }
    
    
    func cancel() {
        self.currentUploadTask?.cancel()
    }
    
    func startUploading(images: [UIImage], completion: @escaping FileCompletionBlock) {
         if images.count == 0 {
            completion()
            return
         }

         block = completion
         uploadImage(forIndex: 0, images: images)
    }

    func uploadImage(forIndex index:Int, images: [UIImage]) {

         if index < images.count {
              /// Perform uploading
             let data = images[index].pngData()!
             
             
             // you can coustimze the image name here
              let fileName = String(format: "%@.png", "yourUniqueFileName + \(index)")

              upload(data: data, withName: fileName, block: { (url) in
                  /// After successfully uploading call this method again by increment the **index = index + 1**
                  print(url ?? "Couldn't not upload. You can either check the error or just skip this.")
                  self.uploadImage(forIndex: index + 1, images: images)
               })
            return;
          }

          if block != nil {
             block!()
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
