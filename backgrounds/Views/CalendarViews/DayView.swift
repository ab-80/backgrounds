import SwiftUI

struct DayView: View, Hashable {
    
    var date: String
    
    init(date: String) {
        self.date = date
    }
    
    var body: some View {
        VStack {
            NavigationLink() {
                InformationView(date: self.date).navigationBarBackButtonHidden(true)
            } label: {
                Label(self.date, systemImage: "bolt.fill").labelStyle(.titleOnly)
            }.buttonStyle(.plain)
        }.frame(maxWidth: 45, maxHeight: 45).background(Color.blue)
    }

}
