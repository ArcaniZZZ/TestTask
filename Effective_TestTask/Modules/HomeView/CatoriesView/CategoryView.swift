//
//  CategoriesView.swift
//  Effective_TestTask
//
//  Created by Arcani on 16.12.2022.
//

import SwiftUI

struct CategoryView: View {
    
    let model: Model
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(model.isChosen ? .orange : .white)
            Image(model.imageName)
                .renderingMode(.template)
                .foregroundColor(model.isChosen ? .white : .gray)
        }
        .frame(width: 70, height: 70)
    }
}

extension CategoryView {
    
    struct Model: Hashable {
        var isChosen: Bool
        let imageName: String
    }
    
}

struct CategoriesView_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            CategoryView(model: .init(isChosen: true, imageName: "PCCategoryIcon"))
        }
    }
}
