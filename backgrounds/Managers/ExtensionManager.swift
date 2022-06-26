//
//  ExtensionManager.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/25/22.
//

import Foundation

extension String {
    public func trimStartingWhitespace(using charSet: CharacterSet = .whitespacesAndNewlines) -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: charSet) }) else {
            return self
        }
        return String(self[index...])
    }
}

extension String {
   public func trimEndingWhitespace(using charSet: CharacterSet = .whitespacesAndNewlines) -> String {
       guard let index = lastIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: charSet) }) else {
            return self
        }
        return String(self[...index])
    }
}
