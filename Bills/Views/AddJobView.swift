import SwiftUI
import SwiftData

struct AddJobView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Bindable var client: Client

    @State private var selectedWorkType: WorkType = .mowing
    @State private var customWorkDescription: String = ""
    @State private var rate: String = ""
    @State private var dateServiced: Date = Date()
    @State private var status: JobStatus = .owed

    var body: some View {
        Form {
            Section(header: Text("Work Details")) {
                Picker("Type of Work", selection: $selectedWorkType) {
                    ForEach(WorkType.allCases) { type in
                        Text(type.rawValue.capitalized).tag(type)
                    }
                }

                if selectedWorkType == .other {
                    TextField("Describe the work", text: $customWorkDescription)
                }

                TextField("Rate", text: $rate)
                    .keyboardType(.decimalPad)

                DatePicker("Date Serviced", selection: $dateServiced, displayedComponents: .date)

                Picker("Payment Status", selection: $status) {
                    ForEach(JobStatus.allCases, id: \.self) { status in
                        Text(status.rawValue.capitalized).tag(status)
                    }
                }

            }

            Button(action: {
                guard let rateValue = Double(rate) else { return }

                let newJob = Job(
                    typeOfWork: selectedWorkType,
                    customWorkDescription: selectedWorkType == .other ? customWorkDescription : nil,
                    rate: rateValue,
                    dateServiced: dateServiced,
                    status: status
                )

                client.jobs.append(newJob)
                modelContext.insert(newJob)

                dismiss()
            }) {
                Text("Add Job")
            }
            .disabled(rate.isEmpty)
        }
        .navigationTitle("Add Job for \(client.name)")
    }
}
