//
//  View + Modifiers.swift
//  Effective_TestTask
//
//  Created by Arcani on 27.12.2022.
//

import SwiftUI

extension View {
    
    /// Creates custom bottom sheet.
    func bottomSheet(
        viewModel: BottomSheetModifier.Model,
        isShowing: Binding<Bool>
    ) -> some View {
        modifier(
            BottomSheetModifier(
                isShowing: isShowing,
                viewModel: viewModel)
        )
    }
    
    /// Creates custom tabBar.
    func tabBarMenu(viewModel: TabBarMenuViewModifier.Model) -> some View {
        modifier(TabBarMenuViewModifier(viewModel: viewModel))
    }
}
