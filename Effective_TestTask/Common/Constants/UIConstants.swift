//
//  UIConstants.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import SwiftUI

enum UIConstants {
    
    // MARK: - Screen Size
    
    enum ScreenSize {
        
        /// and SE(gen 2), 8, 7, 6s, 6
        static var isSE3GenAndSmaller: Bool {
            UIScreen.main.bounds.height <= 667
        }
        
    }
    
    // MARK: - BrandColors
    
    enum BrandColor {
        
        case background
        case backgroundSecondary
        case button
        case yellowRating
        
        var value: UIColor {
            
            switch self {
            case .background:
                return .init(
                    red: 0.96,
                    green: 0.96,
                    blue: 0.96,
                    alpha: 1
                )
                
            case .backgroundSecondary:
                return .init(
                    red: 0,
                    green: 0,
                    blue: 0.21,
                    alpha: 1
                )
                
            case .button:
                return .init(
                    red: 1,
                    green: 0.43,
                    blue: 0.3,
                    alpha: 1
                )
                
            case .yellowRating:
                return .init(
                    red: 255,
                    green: 184,
                    blue: 0,
                    alpha: 1
                )
                
            }
            
        }
        
        var color: Color {
            value.color
        }
    }
    
    
    // MARK: - BrandFonts
    
    enum BrandFont {
        
        // MARK: - Cases
        
        /// Regular weight.
        case regular(_ size: CGFloat)
        
        /// Semibold weight.
        case semibold(_ size: CGFloat)
        
        /// Bold weight
        case bold(_ size: CGFloat)
        
        
        // MARK: - Properties
        
        var font: Font {
            
            switch self {
            case let .regular(size):
                return Font.system(size: size, weight: .regular)
                
            case let .semibold(size):
                return Font.system(size: size, weight: .semibold)
                
            case let .bold(size):
                return Font.system(size: size, weight: .bold)
            }
        }
    }
    
}
