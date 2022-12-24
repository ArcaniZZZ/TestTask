//
//  RoundedBadge.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import SwiftUI

struct RoundedBadge<Content: View>: View {
    
    // MARK: - Properties
    
    @ViewBuilder
    let content: Content
    
    let backgroundColor: Color
    let contentColor: Color
    
    
    // MARK: - Init
    
    init(
        backgroundColor: Color = UIConstants.BrandColor.button.color,
        contentColor: Color = .white,
        @ViewBuilder content: () -> Content
    ) {
        self.backgroundColor = backgroundColor
        self.contentColor = contentColor
        self.content = content()
    }
    
    
    // MARK: - Draawing
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(backgroundColor)
            content
                .foregroundColor(contentColor)
        }
    }
}
