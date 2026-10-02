import SwiftUI

struct DemoCredentialsView: View {

    var body: some View {

        VStack(spacing: 5) {

            Text("Demo Credentials")
                .font(.caption)
                .fontWeight(.bold)

            Text("Username: automation")

            Text("Password: password")
        }
        .font(.caption)
        .foregroundStyle(.secondary)
        .frame(
            maxWidth: .infinity
        )
        .padding()
        .background(
            Color.blue.opacity(0.06)
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 12
            )
        )
        .accessibilityIdentifier(
            "demoCredentials"
        )
    }
}

#Preview {
    DemoCredentialsView()
}
