//
//  ExampleTracker.swift
//

import Foundation
import AnalyticLayer

class ExampleTracker: EventTracker {
    func track(event: String) {
        print("Event: \(event)")
    }
    
    func track<T>(event: String, with parameters: T) where T : AnalyticsParameter {
        print("Event: \(event), Parameters: \(String(describing: parameters.parameter))")
    }
    
    func isEventNameSupported(event: String) -> Bool {
        return !event.isEmpty
    }
}
