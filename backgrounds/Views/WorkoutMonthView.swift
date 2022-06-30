//
//  WorkoutMonthView.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/29/22.
//

import SwiftUI

struct WorkoutMonthView: View {
    @Environment(\.calendar) var calendar
    
    private var currentMonth: DateInterval {
        calendar.dateInterval(of: .month, for: Date())!
    }
    
    private var month: Date {
        calendar.generateDates(
            inside: currentMonth,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        ).first!
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

/*struct WorkoutMonthView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutMonthView()
    }
}*/
