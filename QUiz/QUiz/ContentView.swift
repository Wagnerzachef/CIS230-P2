//
//  ContentView.swift
//  Quiz App
//
//  Created by Zach Wagner on 2/14/24.
//

import SwiftUI

class Manager: ObservableObject {
    @Published var mockQuestions = [
        Question(title: "What animal did Sam always want to see?", answer: "A", options: ["A", "B", "C"]),
        Question(title: "What  did Sam always want to see?", answer: "A", options: ["A", "B", "C"])
    ]
    
    func canSubmit() -> Bool {
        return mockQuestions.filter({ $0.selection == nil }).isEmpty
    }
    func grade() -> String {
        var correct: CGFloat = 0
        for question in mockQuestions {
            if question.answer == question.selection {
                correct += 1
            }
        }
        return "\((correct/CGFloat(mockQuestions.count)) * 100) %"
    }
}

struct ContentView: View {
    @StateObject var manager = Manager()
    
    var body: some View {
        TabView{
            ForEach(manager.mockQuestions.indices, id: \.self) {
                index in
                Spacer()
                QuestionView(question: $manager.mockQuestions[index])
                Spacer()
                
                if let lastQuestion = manager.mockQuestions.last, lastQuestion.id == manager.mockQuestions[index].id{
                    Button {
                        print(manager.canSubmit())
                    } label: {
                        Text("Submit")
                            .padding()
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous).fill(Color(.blue)).frame(width: 300))
                    }
                    .disabled(!manager.canSubmit())

                }
            }
        
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
