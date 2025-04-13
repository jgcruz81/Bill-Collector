//
//  EditJobView.swift
//  Bills
//
//  Created by Juan Cruz on 3/30/25.
//

import SwiftUI
import SwiftData

struct EditJobView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var job: Job

    var body: some View {
        Form {
            Picker("Type of Work", selection: $job.typeOfWork) {
                ForEach(WorkType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            if job.typeOfWork == .other {
                TextField("Describe other work", text: Binding(
                    get: { job.customWorkDescription ?? "" },
                    set: { job.customWorkDescription = $0 }
                ))
            }
            
            TextField("Rate", value: $job.rate, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
            DatePicker("Date Serviced", selection: $job.dateServiced, displayedComponents: .date)
            Picker("Status", selection: $job.status) {
                ForEach(JobStatus.allCases, id: \.self) { status in
                    Text(status.rawValue)
                }
            }

            Button("Save") {
                print("✅ Job edited: \(job.typeOfWork.rawValue) \(job.customWorkDescription ?? "")")
                dismiss()
            }
        }
        .navigationTitle("Edit Job")
    }
}
