//
//  WeekView.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 8/2/22.
//

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

/*struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}*/
