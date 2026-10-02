import SwiftUI

struct LoginErrorView: View {

    var body: some View {

        Label(
            "Invalid username or password",
            systemImage:
                "exclamationmark.triangle.fill"
        )
        .font(.caption)
        .foregroundStyle(.red)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .accessibilityIdentifier(
            "loginError"
        )
    }
}

#Preview {
    LoginErrorView()
}
