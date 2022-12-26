//
//  View + Customizing.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import SwiftUI

extension View {
    
    /// Задаёт фрейм по значению CGSize.
    func frame(_ size: CGSize? = nil, alignment: Alignment = .center) -> some View {
        frame(width: size?.width, height: size?.height, alignment: alignment)
    }
    
    /// Создает квадратный фрейм
    func squaredFrame(squareSide: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: squareSide, height: squareSide, alignment: alignment)
    }
    
    
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
    
}
