import SwiftUI

struct AppLogoView: View {

    var body: some View {

        ZStack {

            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .blue,
                            .purple
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(
                    width: 80,
                    height: 80
                )

            Image(systemName: "iphone.gen3")
                .font(
                    .system(size: 36)
                )
                .foregroundStyle(.white)
        }
        .accessibilityIdentifier("appLogo")
    }
}

#Preview {
    AppLogoView()
}
