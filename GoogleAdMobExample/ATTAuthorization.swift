//
// Project: GoogleAdMobExample
//  File: ATTAuthorization.swift
//  Created by Noah Carpenter
//  🐱 Follow me on YouTube! 🎥
//  https://www.youtube.com/@NoahDoesCoding97
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
//  Dream Big, Code Bigger
// Handles App Tracking Transparency (ATT) permission flow. We only prompt when the system reports
// the status is `.notDetermined`, to avoid bothering users unnecessarily and to comply with policy.

import Foundation
import AppTrackingTransparency // Framework that provides the ATT API (ATTrackingManager)
import AdSupport // Access to advertising identifiers if authorized (not used directly here, but commonly paired with ATT)

// Simple namespace for ATT-related utilities
enum ATTAuthorization {
    // Only request tracking authorization if we haven't asked before. This avoids repeat prompts
    // and follows Apple's guidance for respectful timing and context.
    static func requestIfNeeded() {
        guard ATTrackingManager.trackingAuthorizationStatus == .notDetermined else { return } // If the user already made a choice (allowed/denied), do nothing.
        // Small delay gives the app time to finish launching UI before presenting the system dialog,
        // creating a smoother experience and avoiding potential presentation warnings.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            ATTrackingManager.requestTrackingAuthorization { _ in
                // Optional: react to the new status (e.g., configure SDKs for limited tracking if denied).
            }
        }
    }
}
