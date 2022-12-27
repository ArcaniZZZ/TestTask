//
//  CapacityView.swift
//  Effective_TestTask
//
//  Created by Arcani on 26.12.2022.
//

import SwiftUI

struct CapacityView: View {
    
    // MARK: - Properties
    
    let capacity: String
    var isChosen = false
    
    var body: some View {
        Text(capacity + (isChosen ? " GB" : " gb"))
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .font(BrandFontStyle.bold(13).font)
            .foregroundColor(
                isChosen ? .white : .gray
            )
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(
                        isChosen ? BrandColor.button.color : .white
                    )
            )
            .frame(width: 80, height: 30)
    }
}

struct ChooseCapacityView_Previews: PreviewProvider {
    static var previews: some View {
        CapacityView(capacity: "256", isChosen: true)
    }
}
