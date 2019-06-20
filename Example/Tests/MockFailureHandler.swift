//
//  MockFailureHandler.swift
//

import Foundation
@testable import AnalyticLayer

class MockFailureHandler: FailureHandler {
    var lastMessageSent = ""
    
    func failure(_ message: String) {
        lastMessageSent = message
    }
}
