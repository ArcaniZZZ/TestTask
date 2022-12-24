//
//  BottomSheetContainerView.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//

import SwiftUI

struct BottomSheetContainerView<Content: View>: View {
    
    // MARK: - Properties
    
    let content: Content
    
    
    // MARK: - Drawing
    
    var body: some View {
        content
    }
}
