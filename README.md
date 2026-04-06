# 📱 Google AdMob Example

A SwiftUI app demonstrating how to integrate Google AdMob banner and interstitial ads using the Google Mobile Ads Swift package — including test ad IDs, Info.plist setup, and SwiftUI view integration.

---

## 🤔 What this is

This project shows the full AdMob integration flow in a SwiftUI app: adding the Google Mobile Ads SPM package, configuring `GADApplicationIdentifier` in Info.plist, loading banner ads with `GADBannerView`, and presenting interstitial ads at the right moment. Test ad IDs are used throughout so you can run it safely before launch.

## ✅ Why you'd use it

- **Banner ads** — `GADBannerView` wrapped in a `UIViewRepresentable` for SwiftUI
- **Interstitial ads** — full-screen ad loading and presentation pattern
- **Test IDs** — uses Google's official test ad unit IDs to avoid policy violations during development
- **SPM setup** — adds Google Mobile Ads via Swift Package Manager (no CocoaPods needed)

## ⚠️ Important Setup

1. Replace the `GADApplicationIdentifier` value in `Info.plist` with your app's ID from the [AdMob Dashboard](https://admob.google.com/)
2. Use test ad IDs during development — [found here](https://developers.google.com/admob/ios/test-ads)
3. Only switch to real ad unit IDs at launch to avoid an AdMob ban

**Package Dependency:** [Google Mobile Ads SPM](https://github.com/googleads/swift-package-manager-google-mobile-ads.git)

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/ZPGvJmw2xfc)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/GoogleAdMobExample.git
cd GoogleAdMobExample
```

### 2. Open in Xcode
- Double-click `GoogleAdMobExample.xcodeproj`

### 3. Set Your Development Team
In Xcode: **TARGET → Signing & Capabilities → Team**

### 4. Update the Bundle Identifier
Change `com.example.MyApp` to a unique identifier (e.g., `com.yourname.AdMobExample`).

---

## 🛠️ Notes

- SPM will resolve the Google Mobile Ads package on first open — allow it to finish before building.
- Do not use real ad unit IDs until your app is ready for release.
- If you see a code signing error, check that Team and Bundle ID are set.

## 📦 Requirements

- iOS 16+
- Xcode 15+
- Swift 5.9+
- Google Mobile Ads SDK (via SPM)

---

📺 [Watch the guide on YouTube](https://youtu.be/ZPGvJmw2xfc)
