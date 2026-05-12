import SwiftUI

@main
struct StipApp: App {
    @StateObject private var viewModel          = StepViewModel()
    @StateObject private var notificationManager = NotificationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(notificationManager)
                .preferredColorScheme(.dark)
                .onAppear {
                    // Pass the shared notificationManager into the viewModel
                    viewModel.setNotificationManager(notificationManager)
                    // Check existing HealthKit auth first (no dialog on re-launch)
                    viewModel.checkHealthKitAuthorizationStatus()
                    // Ask for notification permission
                    notificationManager.requestPermission()
                }
        }
    }
}
