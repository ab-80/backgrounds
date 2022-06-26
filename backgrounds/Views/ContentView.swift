//
//  ContentView.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/23/22.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
    private var healthstoreManager: HealthstoreManager!
    
    init() {
        healthstoreManager = HealthstoreManager()
    }
    
    var body: some View {
        VStack {
            if (!self.healthstoreManager.healthstoreAccessible()) {
                InaccessibleView()
        }
            else if (!DefaultsManager.getIsRegistered()){
                RegisterView()
            }
            else {
                WelcomeView()
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
