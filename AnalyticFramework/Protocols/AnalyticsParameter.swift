//
//  AnalyticsParameter.swift
//

import Foundation
/**
 Protocol for any analytic parameters or additional event data.
 
 This provides view controllers the ability to track any type of data.
 
 *It is recommended you implement this protocol with in the following method.*
 
 # Usage
 ```
 public class MyAnalyticsParameter: AnalyticsParameter {
     public var parameter: ParameterType
 
     public typealias ParameterType = [AnyHashable: Any]
 
     init(parameters: [AnyHashable: Any]) {
        self.parameter = parameters
     }
 }
 
 enum MyEventParameters {
     case customObjectName(Int)
     case simpleParameter1
     case simpleParameter2
 
     var parameters: MyAnalyticsParameter {
         switch self {
         case .customObjectName(let custom):
            return [ "Custom Object Name": 1]
         case .simpleParameter1:
            return [ "Simple": "Parameter1" ]
         case .simpleParameter2:
            return [ "Simple": 2 ]
         }
     }
 }
 ```
 */
public protocol AnalyticsParameter {
    var parameter: ParameterType { get }
    associatedtype ParameterType
}
