//
// Project: GoogleAdMobExample
//  File: GoogleAdMobExampleApp.swift
//  Created by Noah Carpenter
//  🐱 Follow me on YouTube! 🎥
//  https://www.youtube.com/@NoahDoesCoding97
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
//  Dream Big, Code Bigger


import SwiftUI
import GoogleMobileAds

// App entry point. Initializes the Google Mobile Ads SDK and requests ATT at an appropriate time.
@main
struct GoogleAdMobExampleApp: App {
    @Environment(\.scenePhase) private var scenePhase // Observe app lifecycle to time privacy prompts and other behaviors
    
    init() {
        // Initialize the Google Mobile Ads SDK early so ad requests can proceed. Status is available
        // in the completion if you need to inspect adapter states.
        MobileAds.shared.start { status in }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { _, newPhase in // Request ATT after the app becomes active to ensure the prompt appears over your UI
            if newPhase == .active { // Present ATT only when foregrounded for a better UX
                ATTAuthorization.requestIfNeeded()
            }
        }
    }
}
