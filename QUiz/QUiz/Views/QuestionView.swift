//
//  QuestionView.swift
//  QUiz
//
//  Created by Zach Wagner on 2/23/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager: QuizManager
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Myth Quiz").lilactitle()
                Spacer()
                Text("\(quizManager.index + 1) out of \(quizManager.length)").foregroundColor(Color(uiColor: .secondaryLabel))
            }
            ProgressBar(progress: quizManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(quizManager.question).font(.system(size: 20)).bold().foregroundColor(.blue)
                
                ForEach(quizManager.answerChoices, id: \.id) {
                    answer in
                    AnswerRow(answer: answer).environmentObject(quizManager)
                }
            }
            Button {
                quizManager.goToNextQuestion()
            } label: {
                primaryButton(text: "Next")
            }
                    .disabled(!quizManager.answerSelected)
            
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView().environmentObject(QuizManager())
    }
}
