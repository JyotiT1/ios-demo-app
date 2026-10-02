import SwiftUI

struct ProfileView: View {

    let username: String
    let onLogout: () -> Void

    var body: some View {

        VStack(spacing: 20) {

            Spacer()


            // MARK: Profile Icon

            Image(
                systemName:
                    "person.circle.fill"
            )
            .font(
                .system(size: 90)
            )
            .foregroundStyle(.blue)
            .accessibilityIdentifier(
                "profileIcon"
            )


            // MARK: Profile

            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
                .accessibilityIdentifier(
                    "profileTitle"
                )


            Text(username)
                .font(.title2)
                .fontWeight(.medium)
                .accessibilityIdentifier(
                    "profileUsername"
                )


            Text(
                "automation@example.com"
            )
            .foregroundStyle(.secondary)
            .accessibilityIdentifier(
                "profileEmail"
            )


            Spacer()


            // MARK: Logout

            Button {

                onLogout()

            } label: {

                Text("Logout")
                    .fontWeight(.semibold)
                    .frame(
                        maxWidth: .infinity
                    )
                    .padding(.vertical, 14)
            }
            .buttonStyle(
                .borderedProminent
            )
            .tint(.red)
            .accessibilityIdentifier(
                "logoutButton"
            )
        }
        .padding()
        .navigationTitle("Profile")
    }
}

#Preview {

    NavigationStack {

        ProfileView(
            username: "automation",
            onLogout: {}
        )
    }
}
