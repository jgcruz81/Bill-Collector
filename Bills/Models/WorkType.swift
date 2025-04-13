//
//  WorkType.swift
//  Bills
//
//  Created by Juan Cruz on 3/21/25.
//

// WorkType.swift
enum WorkType: String, Codable, CaseIterable, Identifiable {
    var id: String { rawValue }

    case mowing, edging, mulching, trimming, planting, leafRemoval, snowRemoval, other
}

