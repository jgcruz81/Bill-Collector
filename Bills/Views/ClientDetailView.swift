import SwiftUI
import SwiftData

struct ClientDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showEditJobSheet = false
    @State private var jobToEdit: Job?

    let client: Client

    var body: some View {
        List {
            Section("Owed") {
                ForEach(client.jobs.filter { $0.status == .owed }) { job in
                    JobRow(job: job)
                        .contextMenu {
                            Button("Edit") {
                                jobToEdit = job
                                showEditJobSheet = true
                            }

                            Button("Delete", role: .destructive) {
                                modelContext.delete(job)
                                print("🗑️ Deleted job: \(job.typeOfWork)")
                            }
                        }
                }
            }

            Section("Paid") {
                ForEach(client.jobs.filter { $0.status == .paid }) { job in
                    JobRow(job: job)
                        .contextMenu {
                            Button("Edit") {
                                jobToEdit = job
                                showEditJobSheet = true
                            }

                            Button("Delete", role: .destructive) {
                                modelContext.delete(job)
                                print("🗑️ Deleted job: \(job.typeOfWork)")
                            }
                        }
                }
            }
        }
        .navigationTitle(client.name)
        .sheet(isPresented: $showEditJobSheet) {
            if let jobToEdit = jobToEdit {
                EditJobView(job: jobToEdit)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddJobView(client: client)) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
