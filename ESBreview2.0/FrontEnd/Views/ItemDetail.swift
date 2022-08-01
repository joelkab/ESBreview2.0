//
//  SEC.swift
//  ESBreview
//
//  Created by Joel Kabura on 4/30/22.
//

import SwiftUI

struct ItemDetail: View {
    
    
    let board : boards
    @ObservedObject var viewmodel = viewModel()
    
    var body: some View {
        VStack(){
           GeometryReader { proxy in
        TabView {
            ForEach(board.moreImage, id: \.self) { item in
                
                Image(item)
                
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(4)
                    .overlay(Color.black.opacity(0.2))
                    .padding()
                    .foregroundColor(Color.black)
                
            }
        }.tabViewStyle(PageTabViewStyle())
                    .frame(width: proxy.size.width, height: proxy.size.height / 1)
                
        }
        ScrollView {
            
        VStack {
            
            Text(board.name)
                .font(.title)

            Text(board.descrption.replacingOccurrences(of: "  ", with: "\n"))
                .padding()
            Link(destination: URL(string: board.Link)!, label: {
                Text("Vist \(board.photoCredit)")
                    .bold()
                    .frame(width: 288, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(12)
                
            })
            
        }
        }
    }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(board: boards.boardexample)
    }
}
