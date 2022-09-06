import SwiftUI

struct InformationView: View {
    var date: Date
    
    var dayString: String = "N/A"
    var monthString: String = "N/A"
    
    init(date: Date, dayString: String) {
        self.date = date
        self.dayString = dayString
        self.monthString = self.SetMonthString()
    }
    
    var body: some View {
        VStack {
            Text("Info view")
            Text("Sleep data for \(self.monthString) \(self.dayString)")
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
         .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
    }
    
    private func SetMonthString() -> String {
        // Only need to set month string for now
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "m"
        return formatter.string(from: self.date)
    }
}
