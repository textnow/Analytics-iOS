//
//  FailureHandler.swift
//

import Foundation

/// Provides injectable failure handler for testing. 
public protocol FailureHandler {
    func failure(_ message: String)
}
