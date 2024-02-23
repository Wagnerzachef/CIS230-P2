//
//  primaryButton.swift
//  QUiz
//
//  Created by Zach Wagner on 2/23/24.
//

import SwiftUI

struct primaryButton: View {
    var text: String
    var body: some View {
        Text(text).padding().padding(.horizontal).background(Color(uiColor: .secondaryLabel))
            .cornerRadius(16).shadow(radius: 10)
    }
}

struct primaryButton_Previews: PreviewProvider {
    static var previews: some View {
        primaryButton(text: "Next")
    }
}
