//
//  EmptyParameter.swift
//

import Foundation

/// Provides internal analytics tracking an empty parameter to allow optional generics.
class EmptyParameter: AnalyticsParameter {
    var parameter: Bool?
    
    typealias ParameterType = Bool?
    
    init() {
        parameter = nil
    }
}

extension AnalyticsParameter {
    func isEmpty() -> Bool {
        return self as? EmptyParameter != nil
    }
}
