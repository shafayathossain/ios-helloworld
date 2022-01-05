//
//  helloworldApp.swift
//  helloworld
//
//  Created by MacBook Pro on 28/12/21.
//

import SwiftUI
import Firebase
import FirebaseInAppMessaging
import AppTrackingTransparency

class AppDelegate: NSObject, UIApplicationDelegate, InAppMessagingDisplayDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Colors application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
        FirebaseApp.configure()
        if NSClassFromString("ATTrackingManager") == nil {
            // Avoid showing the App Tracking Transparency explainer if the
            // framework is not linked.
            InAppMessaging.inAppMessaging().messageDisplaySuppressed = true
        }
        // The InAppMessaging delegate must be assigned before events can be handled.
        InAppMessaging.inAppMessaging().delegate = self
        
        return true
    }
    
    func messageClicked(_ inAppMessage: InAppMessagingDisplayMessage,
                        with action: InAppMessagingAction) {
        switch action.actionText {
        case "OK":
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    // Optionally, log an event when the user accepts.
                    Analytics.logEvent("tracking_authorized", parameters: nil)
                    Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                        AnalyticsParameterItemID: "open first screen",
                        AnalyticsParameterItemName: "First screen",
                        AnalyticsParameterContentType: "text",
                    ])
                case _:
                    // Optionally, log an event here with the rejected value.
                    Analytics.logEvent("tracking_rejected", parameters: nil)
                }
            }
        case _:
            Analytics.logEvent("tracking_nothing", parameters: nil)
        }
    }
}

@main
struct helloworldApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
