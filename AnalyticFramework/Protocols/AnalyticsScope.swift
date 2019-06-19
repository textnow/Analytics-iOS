//
//  AnalyticsScope.swift 
//

public protocol AnalyticsScope {
    /**
     Tracks an event to the `supportedTrackers` on the event.
     
     - Parameter event: The implemented event. Contains a name and array of supported `EventTracker`s.
     */
    func track(event: AnalyticsEvent)
    
    /**
     Tracks an event with parameters to the `supportedTrackers` on the event.
     
     - Parameter event: The implemented event. Contains a name and array of supported `EventTracker`s.
     - Parameter parameters: The implemented parameters. Contains a dictionary of strings.
     */
    func track<T: AnalyticsParameter>(event: AnalyticsEvent, with parameters: T)
    
    /**
     Adds an initialized tracker to allow events with `supportedTrackers` of type 'key' be tracked .
     
     - Parameter key: The implemented `EventTrackerKey`. Contains a string based key.
     - Parameter tracker: An initialized `EventTracker`.
     */
    func addEventTracker(key: EventTrackerKey, tracker: EventTracker)
}
