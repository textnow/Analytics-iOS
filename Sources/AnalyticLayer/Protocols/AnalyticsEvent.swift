//
//  AnalyticsEvent.swift 
//

/**
 Protocol for any analytic event.
 
 This provides view controllers the ability to simply track events and removes responsibility
 from the view controller to dispatch events (`AnalyticsEvent`s) to seperate analytic tools (`EventTrackers`).
 
 *It is recommended you implement this protocol under an enum.*
 
 # Usage
 ```
enum MyEvents: AnalyticsEvents {
    case event1
    case event2
    case event3

    var name: String {
        switch self {
            case .event1: return "Event 1"
            case .event2: return "Event 2"
            case .event3: return "Event 3"
        }
    }

    var supportedTrackers: [EventTrackerKey] {
        switch self {
            case .event1,
            case .event2:
                return [EventTrackerKeys.yourEventTracker.key]
            case .event3:
                return [EventTrackerKeys.yourEventTracker.key,
                        EventTrackerKeys.yourOtherEventTracker.key]
        }
    }
}
 ```
 
 In this example EventTrackerKeys is the implemented struct of EventTrackerKey.
 */
public protocol AnalyticsEvent {
    /// The name that will be used when tracking this event.
    var name: String {get}
    
    /// The `EventTrackerKeys` that correspond to the `EventTracker`s that were added to `Analytics`. For each key this event will be tracked.
    var supportedTrackers: [EventTrackerKey] {get}
}
