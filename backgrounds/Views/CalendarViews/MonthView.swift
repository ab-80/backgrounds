//
//  Original author of this file's source code is mecid on GitHub:
//  https://gist.github.com/mecid/f8859ea4bdbd02cf5d440d58e936faec
//

import SwiftUI

struct MonthView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let month: Date
    let header: String
    let content: (Date) -> DateView

    init(
        month: Date,
        header: String,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.month = month
        self.content = content
        self.header = header
    }

    private var weeks: [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month)
            else { return [] }
        return calendar.generateDates(
            inside: monthInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: calendar.firstWeekday)
        )
    }

    private var formattedHeader: some View {
        return Text(self.header)
            .font(.title)
            .padding()
    }

    var body: some View {
        VStack {
            formattedHeader
            ForEach(weeks, id: \.self) { week in
                WeekView(week: week, content: self.content)
            }
        }
    }
}

/*
struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
    }
}*/
