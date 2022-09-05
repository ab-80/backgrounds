import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        //let greetingString = UtilityManager.getGreeting()
        VStack(spacing: 20){
            SleepMonthView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}
