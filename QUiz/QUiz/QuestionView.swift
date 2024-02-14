//
//  QuestionView.swift
//  Quiz App
//
//  Created by Zach Wagner on 2/14/24.
//

import SwiftUI

struct Question: Identifiable{
    let id = UUID()
    let title: String
    let answer: String
    let options: [String]
    var selection: String?
    
}

struct QuestionView: View {
    @Binding var question: Question
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(question.title)
            ForEach(question.options, id:\.self){
                option in
                HStack{
                    Button {
                        question.selection = option
                        print(option)
                    } label: {
                        if question.selection == option{
                            Circle()
                                
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        } else {
                            Circle()
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        }
                        
                    }
                    Text(option)
                }
                .foregroundColor(Color(uiColor: .secondaryLabel))
            }
        }
        .padding(.horizontal, 20)
        .frame(width: 350, height: 550, alignment: .leading)
        .background(Color.blue)
        .cornerRadius(16)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: .constant(Question(title: "What animal did Sam always want to see?", answer: "A", options: ["A", "B", "C"])))
    }
}
