//
//  FilterView.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//

import SwiftUI

struct FilterView: View {
    
    // MARK: - Properties
    
    let filterText: String

    // MARK: - Drawing
    
    var body: some View {
        HStack {
            Text(filterText)
                .font(BrandFontStyle.regular(17).font)
                .foregroundColor(UIConstants.BrandColor.backgroundSecondary.color)
            Spacer()
            Images.dropDownArrow()?.image
        }
        .frame(height: 37)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 1)
                .foregroundColor(.clear)
            
        }
    }
}


struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(filterText: "Test")
    }
}
