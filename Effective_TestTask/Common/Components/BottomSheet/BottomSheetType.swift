//
//  BottomSheetType.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//

import SwiftUI

enum BottomSheetType {
    case filterBottomSheet(model: FilterBottomSheetView.Model)
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .filterBottomSheet(let model): FilterBottomSheetView(model: model)
        }
    }
}
