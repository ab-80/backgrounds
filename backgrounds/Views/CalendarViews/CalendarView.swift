//
//  Original author of this file's source code is mecid on GitHub:
//  https://gist.github.com/mecid/f8859ea4bdbd02cf5d440d58e936faec
//

import SwiftUI

struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let content: (Date) -> DateView
    private var monthInterval: DateInterval {
        calendar.dateInterval(of: .month, for: Date())!
    }
    
    private var currentMonth: Date {
        calendar.generateDates(
            inside: monthInterval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        ).first!
    }

    init(@ViewBuilder content: @escaping (Date) -> DateView) {
        self.content = content
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                MonthView(month: currentMonth, header: "test", content: self.content)
            }
        }
    }
}

/*struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}*/
