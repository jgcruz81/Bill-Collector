//
//  JobStatus.swift
//  Bills
//
//  Created by Juan Cruz on 4/12/25.
//

import Foundation

enum JobStatus: String, CaseIterable, Codable {
    case owed = "Owed"
    case paid = "Paid"
}

