//
//  frontviewmodle.swift
//  ESBreview2.0
//
//  Created by Joel Kabura on 6/20/22.
//

import Foundation
import Firebase
import SwiftUI


class viewModel: ObservableObject {
    @Published var content = [boards]()
    
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("boards").getDocuments { snapshot, error in
            
            // Check for errors
            
            if error == nil {
                // no errors
                if let snapshot = snapshot {
                    //get all the documents
                    DispatchQueue.main.async {
                        
                        //update the content property in the main theread
                        self.content = snapshot.documents.map { d in
                            // d for document
                            
                            return boards(id: d.documentID, name: d["name"] as? String ?? "", ImageURl: d["ImageURL"] as? String ?? "", descrption: d["description"] as? String ?? "", TopSpeed: d["TopSpeed"] as? Int ?? 30, price: d["price"] as? Int ?? 1000, Link: d["Link"] as? String ?? "", moreImage: d["moreImage"] as? [String] ?? ["",""], photoCredit: d["photoCredit"] as? String ?? "", categoryName: d["categoryName"] as? String)
                        }
                    }
                    
                    
                   
                    
                }
                
            }else {
                
            }
            
        }
        
    }

    
}
