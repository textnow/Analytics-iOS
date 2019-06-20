//
//  EventTrackerKeyTests.swift
//

import XCTest
@testable import AnalyticLayer

class EventTrackerKeyTests: XCTestCase {

    func testEquals() {
        let key = EventTrackerKey("key")
        let key2 = EventTrackerKey("key2")
        XCTAssertEqual(key.name, "key")
        XCTAssertNotEqual(key, key2)
    }
}
