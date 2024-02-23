//
//  AnswerRow.swift
//  QUiz
//
//  Created by Zach Wagner on 2/23/24.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var quizManager: QuizManager
    
    var answer: Answer
    @State private var isSelected = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill").font(.caption)
            Text(answer.text).bold()
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill").foregroundColor(answer.isCorrect ? green : red)
            }
                
        }
        .padding().frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(quizManager.answerSelected ? (isSelected ? Color(uiColor: .secondaryLabel) : .yellow) : Color(uiColor: .secondaryLabel))
        .background(.white).cornerRadius(10)
        .   shadow(color: isSelected ? answer.isCorrect ? green : red : .gray, radius: 5)
            .onTapGesture{
                if !quizManager.answerSelected {
                    isSelected = true
                    quizManager.selectAnswer(answer: answer)
                }
            }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false)).environmentObject(QuizManager())
    }
}
