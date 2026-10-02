import SwiftUI

struct HomeView: View {

    let username: String
    let onLogout: () -> Void

    @State private var task = ""
    @State private var tasks: [String] = []

    var body: some View {

        NavigationStack {

            VStack(spacing: 18) {

                // MARK: Header

                VStack(spacing: 6) {

                    Text("Welcome, \(username)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .accessibilityIdentifier(
                            "homeTitle"
                        )

                    Text(
                        "Automation Learning Dashboard"
                    )
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .accessibilityIdentifier(
                        "homeSubtitle"
                    )
                }


                // MARK: Profile

                NavigationLink {

                    ProfileView(
                        username: username,
                        onLogout: onLogout
                    )

                } label: {

                    HStack {

                        Image(
                            systemName:
                                "person.circle"
                        )

                        Text("Profile")

                        Spacer()

                        Image(
                            systemName:
                                "chevron.right"
                        )
                        .font(.caption)
                    }
                    .padding()
                    .background(
                        Color(
                            .secondarySystemBackground
                        )
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 12
                        )
                    )
                }
                .buttonStyle(.plain)
                .accessibilityIdentifier(
                    "profileButton"
                )


                // MARK: Task Section

                VStack(
                    alignment: .leading,
                    spacing: 8
                ) {

                    Text("Task Management")
                        .font(.title3)
                        .fontWeight(.semibold)

                    HStack {

                        TextField(
                            "Enter task",
                            text: $task
                        )
                        .textFieldStyle(
                            .roundedBorder
                        )
                        .accessibilityIdentifier(
                            "taskInput"
                        )

                        Button {

                            addTask()

                        } label: {

                            Image(
                                systemName: "plus"
                            )
                        }
                        .buttonStyle(
                            .borderedProminent
                        )
                        .accessibilityIdentifier(
                            "addTaskButton"
                        )
                    }
                }


                // MARK: Tasks

                if tasks.isEmpty {

                    VStack(spacing: 10) {

                        Image(
                            systemName: "checklist"
                        )
                        .font(
                            .system(size: 40)
                        )
                        .foregroundStyle(
                            .secondary
                        )

                        Text("No tasks added")
                            .foregroundStyle(
                                .secondary
                            )
                            .accessibilityIdentifier(
                                "emptyTaskMessage"
                            )
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )

                } else {

                    List {

                        ForEach(
                            tasks.indices,
                            id: \.self
                        ) { index in

                            Text(tasks[index])
                                .accessibilityIdentifier(
                                    "task_\(index)"
                                )
                        }
                        .onDelete { indexSet in

                            tasks.remove(
                                atOffsets: indexSet
                            )
                        }
                    }
                    .listStyle(.plain)
                }


                // MARK: Clear All

                Button {

                    tasks.removeAll()

                } label: {

                    Text("Clear All")
                        .frame(
                            maxWidth: .infinity
                        )
                }
                .foregroundStyle(.red)
                .buttonStyle(.bordered)
                .accessibilityIdentifier(
                    "clearAllButton"
                )
            }
            .padding()
            .navigationTitle("Home")
        }
    }


    // MARK: - Add Task

    private func addTask() {

        let newTask =
            task.trimmingCharacters(
                in: .whitespacesAndNewlines
            )

        guard !newTask.isEmpty else {
            return
        }

        tasks.append(newTask)

        task = ""
    }
}

#Preview {

    HomeView(
        username: "automation",
        onLogout: {}
    )
}
