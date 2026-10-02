import SwiftUI

struct PrimaryButton: View {

    let title: String
    let icon: String?

    let action: () -> Void

    let accessibilityID: String

    var body: some View {

        Button(action: action) {

            HStack {

                Text(title)

                if let icon {

                    Image(
                        systemName: icon
                    )
                }
            }
            .fontWeight(.semibold)
            .frame(
                maxWidth: .infinity
            )
            .padding(.vertical, 14)
        }
        .buttonStyle(
            .borderedProminent
        )
        .controlSize(.large)
        .accessibilityIdentifier(
            accessibilityID
        )
    }
}
