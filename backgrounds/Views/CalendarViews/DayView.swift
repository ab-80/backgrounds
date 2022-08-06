//
//  DayView.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 8/6/22.
//

import SwiftUI

struct DayView: View, Hashable {
    
    var date: String
    
    init(date: String) {
        self.date = date
    }
    
    var body: some View {
        VStack {
            Text(self.date)
            }.frame(maxWidth: 45, maxHeight: 45).background(Color.blue)/*.onTapGesture {
                appState.viewToShow = EnumManager.ViewName.information
        }*/
    }

}

/*struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}*/
