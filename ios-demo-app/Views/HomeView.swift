import SwiftUI

struct HomeView: View {

    // MARK: - Properties

    let username: String
    let onLogout: () -> Void

    @State private var task = ""
    @State private var tasks: [String] = []


    // MARK: - Body

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 20) {

                    header

                    dashboardCard

                    profileCard

                    taskSection

                    tasksSection

                }
                .padding()
            }
            .background(
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
            )
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }


    // MARK: - Header

    private var header: some View {

        VStack(
            alignment: .leading,
            spacing: 6
        ) {

            Text("Welcome, \(username)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .accessibilityIdentifier("homeTitle")

            Text("Automation Learning Dashboard")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .accessibilityIdentifier("homeSubtitle")
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }


    // MARK: - Dashboard

    private var dashboardCard: some View {

        HStack {

            DashboardItem(
                icon: "checklist",
                title: "Tasks",
                value: "\(tasks.count)",
                accessibilityID: "taskCount"
            )

            Divider()
                .frame(height: 45)

            DashboardItem(
                icon: "bolt.fill",
                title: "Status",
                value: "Active",
                accessibilityID: "userStatus"
            )
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.background)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 16
            )
        )
        .accessibilityIdentifier("dashboardCard")
    }


    // MARK: - Profile

    private var profileCard: some View {

        NavigationLink {

            ProfileView(
                username: username,
                onLogout: onLogout
            )

        } label: {

            HStack(spacing: 14) {

                Image(
                    systemName:
                        "person.circle.fill"
                )
                .font(.system(size: 40))
                .foregroundStyle(.blue)

                VStack(
                    alignment: .leading
                ) {

                    Text("My Profile")
                        .font(.headline)

                    Text(
                        "View account information"
                    )
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }

                Spacer()

                Image(
                    systemName: "chevron.right"
                )
                .foregroundStyle(.secondary)
            }
            .padding()
            .background(.background)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 16
                )
            )
        }
        .buttonStyle(.plain)
        .accessibilityIdentifier("profileButton")
    }


    // MARK: - Task Section

    private var taskSection: some View {

        VStack(
            alignment: .leading,
            spacing: 10
        ) {

            Text("Task Management")
                .font(.title3)
                .fontWeight(.bold)

            HStack(spacing: 10) {

                TextField(
                    "Enter a new task",
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
                    .frame(
                        width: 42,
                        height: 42
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
    }


    // MARK: - Tasks

    private var tasksSection: some View {

        VStack(
            alignment: .leading,
            spacing: 10
        ) {

            HStack {

                Text("Your Tasks")
                    .font(.headline)

                Spacer()

                Text("\(tasks.count)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(
                        width: 28,
                        height: 28
                    )
                    .background(.blue)
                    .clipShape(Circle())
                    .accessibilityIdentifier(
                        "taskBadge"
                    )
            }


            if tasks.isEmpty {

                emptyState

            } else {

                ForEach(
                    tasks.indices,
                    id: \.self
                ) { index in

                    taskRow(
                        task: tasks[index],
                        index: index
                    )
                }


                Button {

                    tasks.removeAll()

                } label: {

                    Label(
                        "Clear All Tasks",
                        systemImage: "trash"
                    )
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
        }
    }


    // MARK: - Empty State

    private var emptyState: some View {

        VStack(spacing: 10) {

            Image(
                systemName: "checklist"
            )
            .font(
                .system(size: 40)
            )
            .foregroundStyle(.blue)

            Text("No tasks yet")
                .font(.headline)

            Text(
                "Add your first automation task."
            )
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
        .frame(
            maxWidth: .infinity
        )
        .padding(30)
        .background(.background)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 16
            )
        )
        .accessibilityIdentifier(
            "emptyTaskMessage"
        )
    }


    // MARK: - Task Row

    private func taskRow(
        task: String,
        index: Int
    ) -> some View {

        HStack {

            Image(
                systemName:
                    "checkmark.circle.fill"
            )
            .foregroundStyle(.blue)

            Text(task)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )

            Button {

                deleteTask(index)

            } label: {

                Image(
                    systemName: "trash"
                )
                .foregroundStyle(.red)
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier(
                "deleteTask_\(index)"
            )
        }
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 14
            )
        )
        .accessibilityIdentifier(
            "task_\(index)"
        )
    }


    // MARK: - Actions

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


    private func deleteTask(
        _ index: Int
    ) {

        guard tasks.indices.contains(index) else {
            return
        }

        tasks.remove(at: index)
    }
}


// MARK: - Dashboard Item

private struct DashboardItem: View {

    let icon: String
    let title: String
    let value: String
    let accessibilityID: String

    var body: some View {

        HStack(spacing: 10) {

            Image(systemName: icon)
                .foregroundStyle(.blue)

            VStack(
                alignment: .leading,
                spacing: 2
            ) {

                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(value)
                    .font(.headline)
                    .fontWeight(.bold)
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .accessibilityIdentifier(
            accessibilityID
        )
    }
}


// MARK: - Preview

#Preview {

    HomeView(
        username: "automation",
        onLogout: {}
    )
}
