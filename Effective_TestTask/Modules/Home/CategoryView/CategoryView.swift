//
//  CategoriesView.swift
//  Effective_TestTask
//
//  Created by Arcani on 16.12.2022.
//

import SwiftUI

struct CategoryView: View {
    
    // MARK: - Properties
    
    let model: Model
    
    
    // MARK: - Drawing
    
    var body: some View {
        VStack {
            RoundedBadge(
                backgroundColor: model.isChosen ? UIConstants.BrandColor.button.color : .white,
                contentColor: model.isChosen ? .white : .gray
            ) {
                Image(model.imageName)
                    .renderingMode(.template)
                    .foregroundColor(model.isChosen ? .white : .gray)
            }
            .frame(width: 71, height: 71)
            
            Text(model.title)
                .font(BrandFontStyle.regular(12).font)
                .foregroundColor(
                    model.isChosen ? UIConstants.BrandColor.button.color : .black
                )
        }
        
        
    }
}

extension CategoryView {
    
    struct Model: Hashable {
        var isChosen: Bool
        let imageName: String
        var title: String
    }
}

struct CategoriesView_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            CategoryView(model: .init(
                isChosen: true, imageName: "phonesIcon", title: "Phones"
            )
            )
        }
    }
}
