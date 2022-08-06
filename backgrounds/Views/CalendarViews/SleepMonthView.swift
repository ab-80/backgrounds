//
//  SleepMonthView.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 7/26/22.
//

import SwiftUI

struct SleepMonthView: View {
    var body: some View {
        let last28Days: [DayView] = self.getDates()
        let last4Weeks: [[DayView]] = self.turnMonthToWeeks(month: last28Days)

        ForEach(last4Weeks, id: \.self) { week in
            VStack {
                WeekView(week: week)
            }
        }
    }
    
    func getDates() -> [DayView] {
        var last28Days: [DayView] = [DayView]()
        let today = Date()
        var i: Int = 28
        while (i > 0) {
            let prevDay: Date = Calendar.current.date(byAdding: .day, value: -i, to: today)!
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "dd"
            let stringDate: String = self.removeFirstZero(input: formatter.string(from: prevDay))
            last28Days.append(DayView(date: stringDate))
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
    
    private func turnMonthToWeeks(month: [DayView]) -> [[DayView]] {
        var weeks: [[DayView]] = [[DayView]]()
        for i in stride(from: 0, to: 28, by: 7) {
            var week: [DayView] = [DayView]()
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
