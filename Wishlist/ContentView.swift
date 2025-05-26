//
//  ContentView.swift
//  Wishlist
//
//  Created by Sree Lakshman on 26/05/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                }
            } //:List
            .navigationTitle("Wishlist")
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wishlist",
                        systemImage: "heart.circle",
                        description: Text("No wishes yet. Add one to get started."))
                }
            }
        }
    }
}

#Preview("with sample data") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "learn swift data"))
    container.mainContext.insert(Wish(title: "learn swift ui"))
    container.mainContext.insert(Wish(title: "get a job"))
    container.mainContext.insert(Wish(title: "Enjoy life"))
    container.mainContext.insert(Wish(title: "Test Wish"))
    
    return ContentView().modelContainer(container)
}

#Preview("empty list") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
