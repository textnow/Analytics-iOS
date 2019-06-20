//
//  ExampleEvents.swift
//

import Foundation
import AnalyticLayer

enum ExampleEvents: AnalyticsEvent {
    case launch
    case userInteractedWithApp
    case buttonPressed
    
    var name: String {
        switch self {
        case .launch: return "Launch"
        case .userInteractedWithApp: return "User interacted with the app"
        case .buttonPressed: return "BUTTON_PRESSED"
        }
    }
    
    var supportedTrackers: [EventTrackerKey] {
        switch self {
        case .userInteractedWithApp,
             .buttonPressed:
            return [EventTrackerKeys.exampleTracker.key]
        case .launch:
            return [EventTrackerKeys.launchOnlyTracker.key]
        }
    }
}
