//
//  extensions.swift
//  QUiz
//
//  Created by Zach Wagner on 2/23/24.
//

import Foundation
import SwiftUI

extension Text {
    func lilactitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy).foregroundColor(Color(uiColor: .secondaryLabel))
    }
}
