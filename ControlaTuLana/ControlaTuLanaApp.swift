//
//  ControlaTuLanaApp.swift
//  ControlaTuLana
//
//  Created by Bodgar Espinosa Miranda on 06/08/24.
//

import SwiftUI
import SwiftData
import CashSwitchboard
import Common

@main
struct ControlaTuLanaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CashSwitchboard.Transaction.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        ServiceLocator.register((any NavigationService).self, factory: MyCashNavigationService())
        return true
    }
}
