import SwiftUI

struct AppBrandingView: View {

    var body: some View {

        VStack(spacing: 6) {

            Text("Automation Learning")
                .font(
                    .system(
                        size: 28,
                        weight: .bold
                    )
                )
                .multilineTextAlignment(.center)
                .accessibilityIdentifier("appTitle")

            Text("SDET Mobile Automation Lab")
                .font(.subheadline)
                .foregroundStyle(.blue)
                .accessibilityIdentifier("appSubtitle")

            Text("Learn • Build • Test • Automate")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    AppBrandingView()
}
