//
//  DefaultsManager.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/25/22.
//

import Foundation

/* All methods in this class should be made static */
public class DefaultsManager {
    private static var _defaults: UserDefaults = UserDefaults.standard
    
    ///
    ///  GETTERS
    ///
    /* "isRegistered" -> Bool */
    public static func getIsRegistered() -> Bool {
        return _defaults.bool(forKey: ConstantKeysManager.isRegisteredKey)
    }
    
    public static func getFirstName() -> String {
        return _defaults.string(forKey: ConstantKeysManager.firstNameKey) ?? "fitness enthusiast!"
    }
    
    
    ///
    /// SETTERS
    ///
    public static func setFirstName(value: String) -> Void {
        _defaults.set(value, forKey: ConstantKeysManager.firstNameKey)
    }
    
    public static func setIsRegistered(value: Bool) -> Void {
        _defaults.set(value, forKey: ConstantKeysManager.isRegisteredKey)
    }
}
