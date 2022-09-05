import SwiftUI

struct WeekView: View {
    
    let week: [DayView]
    
    init(week: [DayView]) {
        self.week = week
    }
    
    var body: some View {
        HStack{
            ForEach(week, id: \.self){ day in
                day
            }
        }
    }
}
