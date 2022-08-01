//
//  homeviewtest.swift
//  ESBreview2.0
//
//  Created by Joel Kabura on 6/20/22.
//
import SDWebImageSwiftUI
import SwiftUI
import Kingfisher


struct homeviewtest: View {
    @ObservedObject var viewmodel = viewModel()
    var fontSize: CGFloat = 12.0
    
    init() {
        viewmodel.getData()
    }
    
@ViewBuilder var body: some View {
        NavigationView {
            List (viewmodel.content) { board in NavigationLink(destination: ItemDetail(board: board )) {
            HStack(alignment: .center) {
                
                
                KFImage(URL(string: board.ImageURl)!)
                    .downsampling(size: CGSize(width: 128, height: 128))
                    .cacheOriginalImage()
                    .scaledToFit()
                    .cornerRadius(4)
                    .padding(.vertical, 4)
                    
                
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(board.name)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.blue)
                    
                    Text("$\(board.price)")
                    
                    
                    Text("TopSpeed: \(board.TopSpeed)")
                    
                    if board.categoryName == "OffRoad" {
                        Text(board.categoryName ?? "")
                            .font(.system(size: fontSize, weight: .regular))
                                        .lineLimit(2)
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .background(Color.green)
                                        .cornerRadius(5)
                    } 
                        
                        
                        
                    
                }
            }
                
        }
            
        .navigationTitle("Skateboards")
        }
            
    }
        
}
}

struct homeviewtest_Previews: PreviewProvider {
    static var previews: some View {
        homeviewtest()
    }
}
