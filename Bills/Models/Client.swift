// Client.swift
import Foundation
import SwiftData

@Model
class Client: Identifiable {
    var name: String
    var address: String
    @Relationship(deleteRule: .cascade) var jobs: [Job] = []

    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}
