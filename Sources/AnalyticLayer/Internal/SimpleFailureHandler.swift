//
//  SimpleFailureHandler.swift
//

import Foundation

/// The default simple failure handler which asserts when an issue with the analytics setup occurs. See `Analytics.swift` for the error cases.
class SimpleFailureHandler: FailureHandler {
    func failure(_ message: String) {
        assertionFailure(message)
    }
}
