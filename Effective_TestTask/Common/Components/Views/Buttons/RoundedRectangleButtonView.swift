//
//  RoundedRectangleButtonView.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import SwiftUI

struct RoundedRectangleButtonView: View {
    
    // MARK: - Types
    
    enum Style {
        case primary
        case secondary
    }
    
    
    // MARK: - Properties
    
    @Binding
    private var isEnabled: Bool
    
    private let title: String
    private let style: Style
    private let action: SimpleClosure

    private var backgroundColor: Color {
        
        switch style {
        case .primary:
            return UIConstants.BrandColor.button.color
            
        case .secondary:
            return .white
        }
    }
    
    private var fontSize: CGFloat {
        
        switch style {
        case .primary:
            return 20
            
        case .secondary:
            return 11
        }
    }
    
    
    private var foregroundColor: Color {
        
        switch style {
        case .primary:
            return .white
            
        case .secondary:
            return .black
        }
    }
    
    
    // MARK: - Inits
    
    init(
        title: String,
        style: Style = .primary,
        isEnabled: Binding<Bool> = .constant(true),
        action: @escaping SimpleClosure
    ) {
        self.title = title
        self.style = style
        self._isEnabled = isEnabled
        self.action = action
    }
    
    
    // MARK: - Drawing
    
    var body: some View {
        
        GeometryReader { geometry in
            Button(action: action) {
                Text(title)
                    .frame(geometry.size)
                    .foregroundColor(foregroundColor)
                    .background(Rectangle()
                        .cornerRadius(5)
                        .foregroundColor(backgroundColor))
            }
            .disabled(!isEnabled)
        }
        .animation(.easeInOut, value: isEnabled)
        .font(BrandFontStyle.bold(fontSize).font)
    }
    
}

struct RoundedRectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleButtonView(title: "Test button", action: { })
            .frame(height: 50)
    }
}
