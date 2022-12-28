//
//  TabBarMenuViewModifier.swift
//  Effective_TestTask
//
//  Created by Arcani on 27.12.2022.
//

import SwiftUI

struct TabBarMenuViewModifier: ViewModifier {
    
    // MARK: - Types
    
    struct Model {
        let bottomSheetType: TabBarMenuType
    }
    
    let viewModel: Model
    
    
    // MARK: - Drawing
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                TabBarMenuContainerView(
                    content: viewModel.bottomSheetType.view()
                )
            }
        }
    }
}
