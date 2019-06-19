//
//  AnalyticsCoreTests.swift
//

import XCTest
@testable import AnalyticFramework

class AnalyticsCoreTests: XCTestCase {

    func testInitialization() {
        let analytics = Analytics()
        
        XCTAssertNotNil(analytics)
        XCTAssertNotNil(Analytics.shared)
    }
    
    func testEventTracking() {
        let analytics = Analytics()
        let key = EventTrackerKey("key")
        let mockEventTracker = MockAlwaysSupportedEventTracker()
        
        analytics.addEventTracker(key: key, tracker: mockEventTracker)
        analytics.track(event: MockAnalyticsEvent.event)
        XCTAssertEqual(mockEventTracker.lastTrackedEvent, "event")
        XCTAssertEqual(mockEventTracker.lastTrackedParameter, "")
    }
    
    func testEventWithParameterTracking() {
        let analytics = Analytics()
        let key = EventTrackerKey("key")
        let mockEventTracker = MockAlwaysSupportedEventTracker()
        
        analytics.addEventTracker(key: key, tracker: mockEventTracker)
        analytics.track(event: MockAnalyticsEvent.event, with: MockAnalyticsParameter(parameters: 1))
        XCTAssertEqual(mockEventTracker.lastTrackedEvent, "event")
        XCTAssertEqual(mockEventTracker.lastTrackedParameter, "1")
    }
    
    func testTrackEventWithoutAnyEventTrackers() {
        let mockFailureHandler = MockFailureHandler()
        let analytics = Analytics(failureHandler: mockFailureHandler)
        
        analytics.track(event: MockAnalyticsEvent.event)
        XCTAssertEqual(mockFailureHandler.lastMessageSent, "Event event supported tracker key has not been added to Analytics. To fix this you must call Analytics.shared.addEventTracker(key: key, tracker: keyTracker()before tracking an event that is supported by that EventTracker.")
    }
    
    func testUnsupportedEventName() {
        let mockFailureHandler = MockFailureHandler()
        let analytics = Analytics(failureHandler: mockFailureHandler)
        let key = EventTrackerKey("key")
        let mockEventTracker = MockNeverSupportedEventTracker()
        
        analytics.addEventTracker(key: key, tracker: mockEventTracker)
        analytics.track(event: MockAnalyticsEvent.event)
        XCTAssertEqual(mockFailureHandler.lastMessageSent, "Event event is not a supported event by the EventTracker key.")
    }
    
    func testEventWithoutSupportedEventTracker() {
        let mockFailureHandler = MockFailureHandler()
        let analytics = Analytics(failureHandler: mockFailureHandler)
        let key = EventTrackerKey("key")
        let mockEventTracker = MockNeverSupportedEventTracker()
        
        analytics.addEventTracker(key: key, tracker: mockEventTracker)
        analytics.track(event: MockAnalyticsEvent.noSupportedTrackers)
        XCTAssertEqual(mockFailureHandler.lastMessageSent, "Event noSupportedTrackers does not have any supported EventTrackers.")
    }

}
