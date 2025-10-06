//
    // Project: GoogleAdMobExample
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI
import Combine

// Main demo screen showing a banner ad pinned to the bottom and a button to present an interstitial.
// Demonstrates integrating AdMob with SwiftUI layout.
struct ContentView: View {
    @StateObject private var interstitial = InterstitialAdManager() // Own the interstitial manager for the life of this view
    @State private var availableWidth: CGFloat = 320 // Track width to size the adaptive banner appropriately
    
    var body: some View {
        // ZStack allows us to overlay the banner at the bottom while content scrolls above
        ZStack(alignment: .bottom) {
            VStack(spacing: 24) {
                Text("SwiftUI AdMob Demo")
                    .font(.title2).bold()
                
                Text("Anchored Banner (Adaptive)\n Interstitial (Preload + Present)\n ATT Consent on Launch")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                Button("Show Interstitial") {
                    interstitial.present()
                }
                .buttonStyle(.borderedProminent)
                
                Spacer(minLength: 80) // leave room for banner
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(colors: [.indigo.opacity(0.12), .blue.opacity(0.06)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            )
            // Preload an interstitial when the screen appears so it's ready when the user taps
            .onAppear {
                interstitial.load()
            }
            
            // Host the banner in a GeometryReader so we can pass the current width to compute an adaptive size.
            GeometryReader { geo in
                BannerAdView(width: geo.size.width)
                    .frame(width: geo.size.width, height: 50, alignment: .center) // Reserve typical banner height; adaptive banners may adjust internally
                    .background(.ultraThinMaterial) // Slight material background to separate ad from content visually
                    .overlay(Divider(), alignment: .top) // Subtle divider to delineate content and ad area
                    .ignoresSafeArea(edges: .bottom) // Allow the banner to extend to the bottom edge safely
                    .onAppear { availableWidth = geo.size.width } // Initialize width on first layout
                    .onChange(of: geo.size.width) { availableWidth = $0 } // Update width as the device rotates or layout changes
            }
            .frame(height: 50, alignment: .bottom) // Constrain the GeometryReader's height so it doesn't take over the layout
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView()
}

