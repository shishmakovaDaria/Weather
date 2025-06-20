//
//  LocalizableStrings.swift
//  Weather
//
//  Created by Дарья Шишмакова on 20.06.2025.
//

import Foundation

struct LocalizableStrings {
    
    // MARK: - main screen
    static let accordingToLink = String(localized: "accordingToLink", comment: "According to link text")
    static let today = String(localized: "today", comment: "Today text")
    
    // MARK: - alert
    static let error = String(localized: "error", comment: "Error alert title")
    static let ok = String(localized: "ok", comment: "OK button title")
    
    // MARK: - error
    static let unknownError = String(localized: "unknownError", comment: "Unknown error text")
    static let failedProcessData = String(localized: "failedProcessData", comment: "Failed process data error text")
    static let networkError = String(localized: "networkError", comment: "Network error text")
    static let requestError = String(localized: "requestError", comment: "Request error text")
    static let serverError = String(localized: "serverError", comment: "Server error text")
}
