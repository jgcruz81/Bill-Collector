//
//  JobRow.swift
//  Bills
//
//  Created by Juan Cruz on 3/23/25.
//

import SwiftUI

struct JobRow: View {
    var job: Job

    var body: some View {
        VStack(alignment: .leading) {
            Text(job.typeOfWork.rawValue.capitalized)
                .font(.headline)
            Text("Rate: $\(String(format: "%.2f", job.rate))")
            Text("Date: \(job.dateServiced.formatted(date: .abbreviated, time: .omitted))")
            Text("Status: \(job.status.rawValue.capitalized)")
                .foregroundColor(job.status == .owed ? .red : .green)
        }
    }
}
