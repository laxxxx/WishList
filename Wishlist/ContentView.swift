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
    
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
            }
            .alert("Create a new Wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)
                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
            }
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
