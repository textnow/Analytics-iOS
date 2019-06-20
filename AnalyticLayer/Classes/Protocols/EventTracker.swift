//
//  EventTracker.swift
//

/**
 Protocol for any analytic tool.

 Should contain the bare minimum amount of logic to provide mockability of this object.

 # Usage
    ```
import AnalyticTool

class AnalyticToolEventTracker: EventTracker {
    func track(event: String) {
        AnalyticTool.track(event)
    }
 
    func track<T>(event: String, with parameters: T) where T : AnalyticsParameter {
        if let unwrappedParameters = parameters as [AnyHashable: Any] {
            AnalyticTool.track(event, with: unwrappedParameters)
        }

    func isEventNameSupported(event: String) -> Bool {
        return AnalyticTool.isEventValid(event)
    }
}
    ```
 */
public protocol EventTracker {

    /// Tracks an event.
    func track(event: String)
    
    /// Tracks an event with parameters.
    func track<T: AnalyticsParameter>(event: String, with parameters: T)

    /// External use method as a placeholder for if this event tracker has a particular event regex.
    func isEventNameSupported(event: String) -> Bool
}
