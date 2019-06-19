//
//  EventTrackerKeys.swift
//

import Foundation

/// EventTrackerKey allows the core to dispatch an event to the events supported trackers.
/// Having this outside the EventTracker class allows us to force all trackers to one key when testing. 
enum EventTrackerKeys: CaseIterable {
    case exampleTracker
    case launchOnlyTracker
    
    var key: EventTrackerKey {
        switch self {
        case .exampleTracker:
            return EventTrackerKey("exampleTrackerKey")
        case .launchOnlyTracker:
            return EventTrackerKey("launchOnlyTrackerKey")
        }
    }
}
