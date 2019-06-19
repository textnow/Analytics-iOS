//
//  MockAnalyticsEvent.swift
//

import Foundation
@testable import AnalyticFramework

enum MockAnalyticsEvent: AnalyticsEvent {
    case event
    case noSupportedTrackers
    
    var name: String {
        switch self {
        case .event: return "event"
        case .noSupportedTrackers: return "noSupportedTrackers"
        }
    }
    
    var supportedTrackers: [EventTrackerKey] {
        switch self {
        case .event:
            return [EventTrackerKey("key")]
        case .noSupportedTrackers:
            return []
        }
    }
}
