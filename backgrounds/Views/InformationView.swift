import SwiftUI

struct InformationView: View {
    
    var date: String
    
    init(date: String) {
        self.date = date
    }
    
    var body: some View {
        VStack {
            Text("Info view")
            Text("Sleep data for date: \(self.date)")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
         .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
    }
}
