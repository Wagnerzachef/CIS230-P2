//
//  ContentView.swift
//  Quiz App
//
//  Created by Zach Wagner on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quizManager = QuizManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Myth Quiz").lilactitle()
                    Text("Press the button to start").foregroundColor(Color(uiColor: .secondaryLabel))
                }
                NavigationLink {
                    TriviaView().environmentObject(quizManager)
                } label: {
                    primaryButton(text: "Start")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
