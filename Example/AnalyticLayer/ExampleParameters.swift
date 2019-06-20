//
//  ExampleParameters.swift
//

import Foundation
import AnalyticLayer

public class ExampleParameter: AnalyticsParameter {
    public var parameter: ParameterType
    
    public typealias ParameterType = [AnyHashable: Any]
    
    init(parameters: [AnyHashable: Any]) {
        self.parameter = parameters
    }
}

enum ExampleParameterEnum {
    case selectedSegment(Int)
    case toggledSwitch(Bool)
    case movedSlider(Float)
    case exampleMultiple(Int, Bool, Float)
    
    public var parameter: ExampleParameter {
        switch self {
        case let .selectedSegment(int):
            return ExampleParameter(parameters: [ "Selected Segment": int ])
        case let .toggledSwitch(bool):
            return ExampleParameter(parameters: [ "Toggled Switch": bool ])
        case let .movedSlider(float):
            let double = Double(float)
            return ExampleParameter(parameters: [ "Moved Slider": double ])
        case let .exampleMultiple(int, bool, float):
            let double = Double(float)
            return ExampleParameter(parameters: ["Selected Segment": int,
                                                 "Switch State": bool,
                                                 "Slider Position": double])
        }
    }
}
