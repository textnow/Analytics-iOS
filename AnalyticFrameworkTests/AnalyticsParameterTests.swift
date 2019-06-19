//
//  AnalyticsParameterTests.swift
//

import XCTest
@testable import AnalyticFramework

class AnalyticsParameterTests: XCTestCase {
    
    func testInitialization() {
        let mockParameter = MockAnalyticsParameter(parameters: 1)
        XCTAssertEqual(mockParameter.parameter, 1)
    }
}
