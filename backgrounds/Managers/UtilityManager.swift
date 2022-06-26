//
//  UtilityManager.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/25/22.
//

import Foundation

public class UtilityManager {
    public static func getGreeting() -> String {
        let name: String = DefaultsManager.getFirstName()
        return "Good evening, \(name)"
    }
}
