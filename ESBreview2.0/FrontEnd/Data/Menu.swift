//
//  Menu.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI


struct MenuItem: Codable, Identifiable{
    var id: UUID
    var name: String
    var imagename: String
    var photoCredit: String
    var price: Int
    var TopSpeed: Int
    var Link: String
    var ExtraImages: [String]
    var description: String

   
    

    #if DEBUG
    
    
    static let example = MenuItem(id: UUID(), name: "Maple French Toast", imagename: "Meepo_Hurrican", photoCredit: "Joseph Gonzalez", price: 6, TopSpeed: 25, Link: "https://boostedusa.com/products/boosted-mini-x", ExtraImages: ["boostedMini 1", "Meepo_Hurrican", "BoostedMini 3"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}


