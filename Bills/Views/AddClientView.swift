//
//  AddClientView.swift
//  Bills
//
//  Created by Juan Cruz on 3/23/25.
//

import SwiftUI
import SwiftData

struct AddClientView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var name = ""
    @State private var address = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section(header: Text("Client Info")) {
                TextField("Name", text: $name)
                TextField("Address", text: $address)
            }

            Button("Save Client") {
                let newClient = Client(name: name, address: address)
                print("✅ Created new client: \(newClient.name), \(newClient.address)")
                
                modelContext.insert(newClient)
                print("📥 Inserted client into modelContext")
                
                dismiss()
                print("🔚 Dismissed AddClientView")
            }
            .disabled(name.isEmpty || address.isEmpty)
        }
        .navigationTitle("Add Client")
    }
}
