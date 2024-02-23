//
//  TriviaView.swift
//  QUiz
//
//  Created by Zach Wagner on 2/23/24.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var quizManager: QuizManager
    var body: some View {
        if quizManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Myth Quiz")
                    .lilactitle()
                Text("Congratulations for finishing the quiz!")
                Text("You scored \(quizManager.score) out of \(quizManager.length)")
                
                Button {
                    Task.init {
                        await quizManager.fetchTrivia()
                    }
                } label: {
                    primaryButton(text: "Play Again")
                }

            }
            .foregroundColor(Color(uiColor: .secondaryLabel))
            .padding().frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            QuestionView().environmentObject(quizManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView().environmentObject(QuizManager())
    }
}
