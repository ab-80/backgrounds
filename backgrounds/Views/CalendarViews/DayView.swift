import SwiftUI

struct DayView: View, Hashable {
    var date: Date
    var dayString: String = "N/A"
    var infoView: InformationView
    
    init(date: Date) {
        self.date = date
        self.dayString = DayView.setDayString(date: self.date)
        self.infoView = InformationView(date: self.date, dayString: self.dayString)
    }
    
    var body: some View {
        VStack {
            NavigationLink() {
                self.infoView
            } label: {
                Label(self.dayString, systemImage: "bolt.fill").labelStyle(.titleOnly)
            }.buttonStyle(.plain)
        }.frame(maxWidth: 45, maxHeight: 45).background(Color.blue)
    }
    
    private static func setDayString(date: Date) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "dd"
        return removeFirstZero(input: formatter.string(from: date))
    }
    
    private static func removeFirstZero(input: String) -> String {
        if (input.count <= 0) { return input }
        else if (input[input.index(input.startIndex, offsetBy: 0)] == "0") {
             return String(input[input.index(input.startIndex, offsetBy: 1)])
        }
        else { return input }
    }
    
    static func == (lhs: DayView, rhs: DayView) -> Bool {
        return lhs.date == rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.date)
        hasher.combine(self.dayString)
    }
}
