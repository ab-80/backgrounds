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
    @ObservedObject var appState = AppState(showView: EnumManager.ViewName.welcome)
    
    init() {
        healthstoreManager = HealthstoreManager()
        findFirstView()
    }
    
    var body: some View {
        VStack {
            switch appState.viewToShow {
            case EnumManager.ViewName.welcome:
                WelcomeView().environmentObject(appState)
            case EnumManager.ViewName.inaccessible:
                InaccessibleView().environmentObject(appState)
            case EnumManager.ViewName.register:
                RegisterView().environmentObject(appState)
            case EnumManager.ViewName.information:
                InformationView().environmentObject(appState)
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
    
    private func findFirstView() -> Void {
        if (!self.healthstoreManager.healthstoreAccessible()) {
            appState.viewToShow = EnumManager.ViewName.inaccessible
    }
        else if (!DefaultsManager.getIsRegistered()){
            appState.viewToShow = EnumManager.ViewName.register
        }
        else {
            appState.viewToShow = EnumManager.ViewName.welcome
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class AppState: ObservableObject {
    @Published var viewToShow: EnumManager.ViewName

    init(showView: EnumManager.ViewName) {
        self.viewToShow = showView
    }
}
