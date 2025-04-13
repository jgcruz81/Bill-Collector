// Job.swift
import Foundation
import SwiftData

@Model
class Job {
    var typeOfWork: WorkType
    var customWorkDescription: String?
    var rate: Double
    var dateServiced: Date
    var status: JobStatus
    @Relationship var client: Client?

    init(typeOfWork: WorkType, customWorkDescription: String? = nil, rate: Double, dateServiced: Date, status: JobStatus, client: Client? = nil) {
        self.typeOfWork = typeOfWork
        self.customWorkDescription = customWorkDescription
        self.rate = rate
        self.dateServiced = dateServiced
        self.status = status
        self.client = client
    }
    
    var displayedWorkType: String {
        if typeOfWork == .other {
            return customWorkDescription ?? "Other"
        } else {
            return typeOfWork.rawValue
        }
    }
}

enum PaymentStatus: String, Codable, CaseIterable, Identifiable {
    var id: String { rawValue }

    case owed
    case paid
}

