//
//  MockAlwaysSupportedEventTracker.swift
//

import Foundation
@testable import AnalyticLayer

class MockAlwaysSupportedEventTracker: EventTracker {
    
    var lastTrackedEvent: String = ""
    var lastTrackedParameter: String = ""
    
    func track(event: String) {
        lastTrackedEvent = event
        lastTrackedParameter = ""
    }
    
    func track<T>(event: String, with parameters: T) where T : AnalyticsParameter {
        lastTrackedEvent = event
        lastTrackedParameter = String(describing: parameters.parameter)
    }
    
    func isEventNameSupported(event: String) -> Bool {
        return true
    }
}
