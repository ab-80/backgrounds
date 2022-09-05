//
//  UtilityManager.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/25/22.
//

import Foundation

public class UtilityManager {
    /*public static func getGreeting() -> String {
        let name: String = DefaultsManager.getFirstName()
        return "Good evening, \(name)"
    }*/
}

// https://gist.github.com/mecid/f8859ea4bdbd02cf5d440d58e936faec
public extension DateFormatter {
    static var month: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }

    static var monthAndYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}

// https://gist.github.com/mecid/f8859ea4bdbd02cf5d440d58e936faec
public extension Calendar {
    func generateDates(
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)

        enumerateDates(
            startingAfter: interval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }

        return dates
    }
}
