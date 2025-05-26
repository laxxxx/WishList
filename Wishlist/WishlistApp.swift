//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Sree Lakshman on 26/05/25.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
