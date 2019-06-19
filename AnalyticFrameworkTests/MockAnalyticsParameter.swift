//
//  MockAnalyticsParameter.swift
//

import Foundation
@testable import AnalyticFramework

class MockAnalyticsParameter: AnalyticsParameter {
    public var parameter: ParameterType
    
    public typealias ParameterType = Int
    
    init(parameters: Int) {
        self.parameter = parameters
    }
}
