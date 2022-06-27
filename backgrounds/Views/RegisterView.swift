//
//  RegisterView.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/25/22.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var appState: AppState
    @State private var firstName: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to backgrounds!").bold().font(.title)
                
                Text("Let's get to know you by learning your name. This can be changed later in your account settings.").padding(.bottom, 100)
                
                TextField("Enter your first name", text: $firstName).textFieldStyle(.plain).frame(minWidth: 80, maxWidth: 250).foregroundColor(.white).padding(.bottom, -8)
                
                Divider()
                    .frame(height: 1).background(.white).frame( minWidth: 80, maxWidth: 250).padding(.top, -8)
                
                Button(action: verifyInput ) {
                    Text("Continue")
                }
                .alert(isPresented: $showAlert, content:
                        { Alert(title: Text("Please enter a valid name")) }
                        )
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func verifyInput() {
        let cleanedName: String = self.firstName.trimStartingWhitespace().trimEndingWhitespace()
        
        if (0 == cleanedName.count) {
            self.showAlert = true
        }
        else {
            DefaultsManager.setFirstName(value: self.firstName)
            DefaultsManager.setIsRegistered(value: true)
            appState.viewToShow = EnumManager.ViewName.welcome
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
