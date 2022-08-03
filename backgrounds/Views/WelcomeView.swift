//
//  Welcome.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/23/22.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.calendar) var calendar
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        let greetingString = UtilityManager.getGreeting()
        VStack {
            VStack(spacing: 20){
                Text(greetingString).bold().font(.title)
                SleepMonthView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            appState.viewToShow = EnumManager.ViewName.information
        }
    }
}

/*struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}*/
