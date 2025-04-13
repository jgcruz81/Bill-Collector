//
//  ContentView.swift
//  Bills
//
//  Created by Juan Cruz on 3/21/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext)  private var modelContext
    @Query(sort: \Client.name) private var clients: [Client]
    @State private var searchText = ""
    
    var filteredClients:  [Client] {
        if searchText.isEmpty {
            return clients
        }  else {
            return clients.filter  {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.address.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredClients) { client in
                    NavigationLink(destination: ClientDetailView(client: client)) {
                        VStack(alignment: .leading) {
                            Text(client.name).font(.headline)
                            Text(client.address).font(.subheadline)
                            Text("Client Count: \(clients.count)")
                        }
                    }
                }
                .onDelete(perform: deleteClient)
            }
            .navigationTitle("Clients")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink("➕ Add", destination: AddClientView())
                }
            }
            .searchable(text: $searchText)
        }
    }
    
    func deleteClient(at offsets: IndexSet) {
        for index in offsets {
            let client = filteredClients[index]
            modelContext.delete(client)
            print("🗑️ Deleted client: \(client.name)")
        }
    }
}

#Preview {
    ContentView()
}
