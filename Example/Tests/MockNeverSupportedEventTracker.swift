//
//  MockNeverSupportedEventTracker.swift
//

import Foundation
@testable import AnalyticLayer

class MockNeverSupportedEventTracker: EventTracker {
    func track(event: String) {
        assertionFailure("Should never track on this event tracker.")
    }
    
    func track<T>(event: String, with parameters: T) where T : AnalyticsParameter {
        assertionFailure("Should never track on this event tracker.")
    }
    
    func isEventNameSupported(event: String) -> Bool {
        return false
    }
}
