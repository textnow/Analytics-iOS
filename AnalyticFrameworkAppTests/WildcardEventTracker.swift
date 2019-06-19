//
//  WildcardEventTracker.swift
//

import Foundation

class WildcardEventTracker: EventTracker {
    
    let customEventSupport: ((String) -> Bool)?
    
    var eventCount = 0
    var parameterCount = 0
    
    var lastEventTracked = ""
    var lastParameterTracked = ""
    
    init(customEventSupport: ((String) -> Bool)? = nil) {
        self.customEventSupport = customEventSupport
    }
    
    func track(event: String) {
        lastEventTracked = event
        eventCount += 1
    }
    
    func track<T>(event: String, with parameters: T) where T : AnalyticsParameter {
        track(event: event)
        parameterCount += 1
        lastParameterTracked = String(describing: parameters.parameter)
    }
    
    func isEventNameSupported(event: String) -> Bool {
        if let customEventSupport = customEventSupport {
            return customEventSupport(event)
        } else {
            return true
        }
    }
}
