//
//  Analytics.swift
//

import Foundation

/// Provides a singleton for an external access method to track events and an external access method to add all the required `EventTracker`s.
open class Analytics: AnalyticsScope {
    
    public static let shared: AnalyticsScope = Analytics()
    
    private var eventTrackers: [EventTrackerKey: EventTracker] = [:]
    
    private let failureHandler: FailureHandler
    
    public init() {
        failureHandler = SimpleFailureHandler()
    }
    
    public init(failureHandler: FailureHandler) {
        self.failureHandler = failureHandler
    }
    
    public func track(event: AnalyticsEvent) {
        trackAnalytic(event: event, parameters: EmptyParameter())
    }
    
    public func track<T>(event: AnalyticsEvent, with parameters: T) where T : AnalyticsParameter {
        trackAnalytic(event: event, parameters: parameters)
    }
    
    public func addEventTracker(key: EventTrackerKey, tracker: EventTracker) {
        // Executes the dictionary entry on the same thread if it can. 
        DispatchQueue(label: "com.test.mySerialQueue").sync {
            eventTrackers[key] = tracker
        }
    }
    
    private func trackAnalytic<T: AnalyticsParameter>(event: AnalyticsEvent, parameters: T?) {
        if event.supportedTrackers.isEmpty {
            failureHandler.failure("Event \(event.name) does not have any supported EventTrackers.")
            return
        }
        
        for trackerKey in event.supportedTrackers {
            if let eventTracker = eventTrackers[trackerKey] {
                if eventTracker.isEventNameSupported(event: event.name) {
                    if let parameters = parameters, !parameters.isEmpty() {
                        eventTracker.track(event: event.name, with: parameters)
                    } else {
                        eventTracker.track(event: event.name)
                    }
                } else {
                    failureHandler.failure("Event \(event.name) is not a supported event by the EventTracker \(trackerKey.name).")
                }
            } else {
                failureHandler.failure("Event \(event.name) supported tracker \(trackerKey.name) has not been added to Analytics. " +
                    "To fix this you must call Analytics.shared.addEventTracker(key: \(trackerKey.name), tracker: \(trackerKey.name)Tracker()" +
                    "before tracking an event that is supported by that EventTracker.")
            }
        }
    }
}
