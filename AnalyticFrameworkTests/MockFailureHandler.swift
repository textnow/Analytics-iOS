//
//  MockFailureHandler.swift
//

import Foundation
@testable import AnalyticFramework

class MockFailureHandler: FailureHandler {
    var lastMessageSent = ""
    
    func failure(_ message: String) {
        lastMessageSent = message
    }
}
