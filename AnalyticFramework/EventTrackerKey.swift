//
//  EventTrackerKey.swift 
//

/// Provides a type that `AnalyticsEvent` uses to track on specific trackers with the given type.
/// This will be used when adding `EventTracker`s to `Analytics` and when setting up an `AnalyticsEvent`'s `supportedTrackers`. 
public class EventTrackerKey: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.name.hashValue)
    }
    
    public static func == (lhs: EventTrackerKey, rhs: EventTrackerKey) -> Bool {
        return (lhs.name == rhs.name)
    }
    
    /// A unique name for your `EventTrackerKey`.
    public let name: String
    
    public init(_ name: String) {
        self.name = name
    }
}
