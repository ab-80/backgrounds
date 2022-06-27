//
//  InaccessibleView.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/23/22.
//

import SwiftUI

struct InaccessibleView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Sorry, backgrounds is unable to access necessary health data from your device").bold().font(.title)
                
                Text("This is most likely because this iPhone is either too out of date, or isn't paired with an Apple Watch").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct InaccessibleView_Previews: PreviewProvider {
    static var previews: some View {
        InaccessibleView()
    }
}
