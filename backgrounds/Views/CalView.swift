//
//  Original author of this file's source code is mecid on GitHub:
//  https://gist.github.com/mecid/f8859ea4bdbd02cf5d440d58e936faec
//

import SwiftUI

struct RootView: View {
    @Environment(\.calendar) var calendar

    private var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }
    private var currentMonth: DateInterval {
        calendar.dateInterval(of: .month, for: Date())!
    }

    var body: some View {
        CalendarView() { date in
            Text("30")
                .hidden()
                .padding(8)
                .background(Color.blue)
                .clipShape(Circle())
                .padding(.vertical, 4)
                .overlay(
                    Text(String(self.calendar.component(.day, from: date)))
                )
        }
    }
}
