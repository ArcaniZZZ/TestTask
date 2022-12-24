//
//  BottomSheetViewModifier.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//


import SwiftUI

struct BottomSheetModifier: ViewModifier {
    
    // MARK: - Types
    
    struct Model {
        let height: CGFloat
        let bottomSheetType: BottomSheetType
    }
    
    
    // MARK: - Properties
    
    @Binding
    var isShowing: Bool
    
    let viewModel: Model
    
    
    // MARK: - Drawing
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isShowing) {
                BottomSheetContainerView(content: viewModel.bottomSheetType.view())
                    .presentationDetents(([.height(viewModel.height)]))
                    .presentationDragIndicator(.hidden)
            }
    }
}
