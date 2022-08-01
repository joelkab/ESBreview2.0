//
//  HomeView.swift
//  ESBreview
//
//  Created by Joel Kabura on 5/12/22.
//

import SwiftUI

struct HomeView: View {
    
    let menu = Bundle.main.decode([MenuItem].self, from: "menu.json")
    
    @ObservedObject var viewmodel = viewModel()
    
    var body: some View {
        
        NavigationView {
            
           
            List(viewmodel.content) { boardsz in NavigationLink(destination: ItemDetail(board: boardsz )) {
                
                HStack {
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(boardsz.name)")
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Text("$\(boardsz.price)")
                        
                    }
                    
                    
                }
            }.navigationTitle("SkateBoards")
                
            }
            // How to fix: SwiftUI Unable to simultaneously satisfy constraints
            //added navigation title to the navigationview instead of adding it to the list.
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
