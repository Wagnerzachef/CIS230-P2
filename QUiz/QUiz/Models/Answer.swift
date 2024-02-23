//
//  Answer.swift
//  QUiz
//
//  Created by Zach Wagner on 2/23/24.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}

