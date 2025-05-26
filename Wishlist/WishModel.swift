//
//  WishModel.swift
//  Wishlist
//
//  Created by Sree Lakshman on 26/05/25.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
