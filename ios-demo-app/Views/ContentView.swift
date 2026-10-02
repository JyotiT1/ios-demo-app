import SwiftUI

struct ContentView: View {

    @State private var username = ""
    @State private var password = ""

    @State private var isLoggedIn = false
    @State private var showLoginError = false
    

    var body: some View {

        if isLoggedIn {

            HomeView(
                username: username,
                onLogout: logout
            )

        } else {

            loginView
        }
    }

    // MARK: - Login View

    private var loginView: some View {

        NavigationStack {

            ZStack {

                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                ScrollView {

                    VStack(spacing: 22) {

                        AppLogoView()

                        AppBrandingView()

                        loginCard

                        Text(
                            "Automation Learning - SDET"
                        )
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    }
                    .padding(20)
                }
            }
            .toolbar(
                .hidden,
                for: .navigationBar
            )
        }
    }

    // MARK: - Login Card

    private var loginCard: some View {

        VStack(spacing: 18) {

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text("Welcome Back")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Sign in to continue")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )


            // Username

            AppTextField(
                title: "Username",
                placeholder: "Enter username",
                icon: "person.fill",
                text: $username,
                accessibilityID: "usernameField"
            )


            // Password

            AppTextField(
                title: "Password",
                placeholder: "Enter password",
                icon: "lock.fill",
                text: $password,
                isSecure: true,
                accessibilityID: "passwordField"
            )


            // Error

            if showLoginError {
                LoginErrorView()
            }


            // Login

            PrimaryButton(
                title: "Login",
                icon: "arrow.right",
                action: login,
                accessibilityID: "loginButton"
            )


            // Demo Credentials

            DemoCredentialsView()
        }
        .padding(24)
        .background(.background)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20
            )
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 12,
            x: 0,
            y: 6
        )
    }


    // MARK: - Login

    private func login() {

        if username == User.demo.username &&
            password == User.password {

            showLoginError = false
            isLoggedIn = true

        } else {

            showLoginError = true
        }
    }


    // MARK: - Logout

    private func logout() {

        username = ""
        password = ""

        isLoggedIn = false
        showLoginError = false
    }
}

#Preview {
    ContentView()
}
