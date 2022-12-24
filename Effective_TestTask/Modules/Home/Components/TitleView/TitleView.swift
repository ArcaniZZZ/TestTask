//
//  TitleView.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//

import SwiftUI

struct TitleView: View {
    
    // MARK: - Properties
    
    let title: String
    let buttonTitle: String
    let buttonAction: () -> Void
    
    
    // MARK: - Drawing
    
    var body: some View {
        HStack {
            Text(title)
                .font(BrandFontStyle.bold(25).font)
            Spacer()
            Button(action: buttonAction) {
                Text(buttonTitle)
                    .font(BrandFontStyle.regular(15).font)
                    .foregroundColor(
                        UIConstants.BrandColor.button.color
                    )
            }
        }.padding(.horizontal)
    }
}
