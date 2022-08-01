//
//  data.swift
//  ESBreview2.0
//
//  Created by Joel Kabura on 6/20/22.
//

import Foundation

struct boards: Identifiable {
    var id: String
    var name: String
    var ImageURl: String
    var descrption: String
    var TopSpeed: Int
    var price: Int
    var Link: String
    var moreImage: [String]
    var photoCredit: String
    var categoryName: String?
    
    
    
#if DEBUG


    static let boardexample = boards(id: "6o77KxOFf70NTVnB026q", name: "Meepo Hurrican", ImageURl: "https://cdn.shopify.com/s/files/1/2096/3333/products/e8093058-dfc0-4f07-a094-5495c6d85eb1_1024x.png?v=1650608145", descrption: "Joseph Gonzalez", TopSpeed: 6, price: 25, Link: "https://boostedusa.com/products/boosted-mini-x", moreImage: [ "Meepo-V31","Meepo-V32","Meepo-V33"], photoCredit: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
#endif
}
