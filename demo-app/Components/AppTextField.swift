import SwiftUI

struct AppTextField: View {

    let title: String
    let placeholder: String
    let icon: String

    @Binding var text: String

    var isSecure: Bool = false

    let accessibilityID: String

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 7
        ) {

            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)

            HStack(spacing: 10) {

                Image(systemName: icon)
                    .foregroundStyle(.blue)

                if isSecure {

                    SecureField(
                        placeholder,
                        text: $text
                    )

                } else {

                    TextField(
                        placeholder,
                        text: $text
                    )
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                }
            }
            .padding()
            .background(
                Color(.secondarySystemBackground)
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 12
                )
            )
            .accessibilityIdentifier(
                accessibilityID
            )
        }
    }
}
