//
//  AppDelegate.swift
//

import UIKit
import AnalyticLayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Used to show how you would test the singleton pattern, if you decide to use it.
        Analytics.shared.addEventTracker(key: EventTrackerKeys.launchOnlyTracker.key, tracker: LaunchOnlyTracker())
        return true
    }
}
