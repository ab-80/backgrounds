//
//  SleepMonthView.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 7/26/22.
//

import SwiftUI

struct SleepMonthView: View {
    var body: some View {
        let last28Days: [String] = self.getDates()
        let last4Weeks: [[String]] = self.turnMonthToWeeks(month: last28Days)

        ForEach(last4Weeks, id: \.self) { week in
            VStack {
                WeekView(week: week)
            }
        }
    }
    
    func getDates() -> [String] {
        var last28Days: [String] = [String]()
        let today = Date()
        var i: Int = 28
        while (i > 0) {
            let prevDay: Date = Calendar.current.date(byAdding: .day, value: -i, to: today)!
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "dd"
            var stringDate: String = self.removeFirstZero(input: formatter.string(from: prevDay))
            last28Days.append(stringDate)
            i -= 1
        }
        return last28Days
    }
    
    private func removeFirstZero(input: String) -> String {
        if (input.count <= 0) { return input }
        else if (input[input.index(input.startIndex, offsetBy: 0)] == "0") {
             return String(input[input.index(input.startIndex, offsetBy: 1)])
        }
        else { return input }
        
    }
    
    private func turnMonthToWeeks(month: [String]) -> [[String]] {
        var weeks: [[String]] = [[String]]()
        for i in stride(from: 0, to: 28, by: 7) {
            var week: [String] = [String]()
            week = Array(month[i..<(i+7)])
            weeks.append(week)
        }
        return weeks
    }
}

/*struct SleepMonthView_Previews: PreviewProvider {
    static var previews: some View {
        SleepMonthView()
    }
}*/
