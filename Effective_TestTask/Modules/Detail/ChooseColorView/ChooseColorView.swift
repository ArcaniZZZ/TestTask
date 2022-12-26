//
//  ChooseColorView.swift
//  Effective_TestTask
//
//  Created by Arcani on 26.12.2022.
//

import SwiftUI

struct ColoredCircleButton : View {
    
    // MARK: - Properties
    
    var isChosen = false
    let color: String
    
    // MARK: - Drawing
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(hex: color))
            Images.checkmark()?.image
                .opacity(isChosen ? 1 : 0)
                .foregroundColor(color == "FFFFFF" ? .black : .white)
        }
        .squaredFrame(squareSide: 40)
    }
}


struct ColoredCircleButton_Previews: PreviewProvider {
    static var previews: some View {
        ColoredCircleButton(color: "#772D03")
    }
}
