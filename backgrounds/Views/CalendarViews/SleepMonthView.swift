import SwiftUI

struct SleepMonthView: View {
    var body: some View {
        let last28Days: [DayView] = self.getDates()
        let last4Weeks: [[DayView]] = self.turnMonthToWeeks(month: last28Days)

        VStack {
            Text("Past month of sleep data").font(.title)
            Text("Tap to view sleep details").font(.body)
        }
        ForEach(last4Weeks, id: \.self) { week in
            VStack {
                WeekView(week: week)
            }
        }
    }
    
    func getDates() -> [DayView] {
        var last28Days: [DayView] = [DayView]()
        let today = Date()
        var i: Int = 27
        while (i >= 0) {
            let prevDate: Date = Calendar.current.date(byAdding: .day, value: -i, to: today)!
            last28Days.append(DayView(date: prevDate))
            i -= 1
        }
        return last28Days
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
