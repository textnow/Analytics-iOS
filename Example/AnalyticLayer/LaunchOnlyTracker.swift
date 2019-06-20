//
//  LaunchOnlyTracker.swift
//

import Foundation
import AnalyticLayer

class LaunchOnlyTracker: EventTracker {
    func track(event: String) {
        print("Event: \(event)")
    }
    
    func track<T>(event: String, with parameters: T) where T : AnalyticsParameter {
        assertionFailure("Should not be tracking events to this tracker with parameters.")
    }
    
    func isEventNameSupported(event: String) -> Bool {
        return event == "Launch"
    }
}
