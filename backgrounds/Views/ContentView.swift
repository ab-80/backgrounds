import SwiftUI
import HealthKit

struct ContentView: View {
    private var healthstoreManager: HealthstoreManager!
    private var firstView: EnumManager.ViewName  = EnumManager.ViewName.inaccessible
    init() {
        healthstoreManager = HealthstoreManager()
        self.firstView = findFirstView()
    }
    
    var body: some View {
        VStack {
            Text("backgrounds").bold().frame(maxWidth: .infinity, alignment: .top).font(.title)
            switch firstView {
            case EnumManager.ViewName.welcome:
                //WelcomeView().environmentObject(appState)
                NavigationView {
                    WelcomeView()
                }
            case EnumManager.ViewName.inaccessible:
                //InaccessibleView().environmentObject(appState)
                NavigationView {
                    InaccessibleView()
                }
            case EnumManager.ViewName.register:
                //RegisterView().environmentObject(appState)
                NavigationView {
                    RegisterView()
                }
            default:
                NavigationView {
                    InaccessibleView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
    
    private func findFirstView() -> EnumManager.ViewName {
        if (!self.healthstoreManager.healthstoreAccessible()) {
            return  EnumManager.ViewName.inaccessible
    }
        else if (!DefaultsManager.getIsRegistered()){
            return EnumManager.ViewName.register
        }
        else {
            return EnumManager.ViewName.welcome
        }
    }
}
