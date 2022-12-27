//
//  AddFavouriteButtonView.swift
//  Effective_TestTask
//
//  Created by Arcani on 22.12.2022.
//

import SwiftUI

struct AddFavoriteButtonView: View {
    
    // MARK: - Types
    
    enum ButtonStyle {
        case circle
        case rectangle
        
        var backgroundColor: Color {
            switch self {
            case .circle:
                return .white
                
            case .rectangle:
                return BrandColor.backgroundSecondary.color
            }
        }
        
        var imageColor: Color {
            switch self {
            case .circle:
                return BrandColor.button.color
                
            case .rectangle:
                return .white
            }
        }
        
    }
    
    
    // MARK: - Local Constants
    
    enum Locals {
        static let shadowRadius: CGFloat = 20
    }
    
    
    // MARK: - Properties
    
    @State
    var isFavorite: Bool
    
    let buttonStyle: ButtonStyle
    
    let action: SimpleClosure
    
    var image: Image? {
        return isFavorite ? Images.heartFilled()?.image : Images.heartBlank()?.image
    }
    
    
    // MARK: - Init
    
    init(
        buttonStyle: ButtonStyle = .circle,
        isFavorite: Bool,
        action: @escaping SimpleClosure
    ) {
        self.buttonStyle = buttonStyle
        self.isFavorite = isFavorite
        self.action = action
    }
    
    
    // MARK: - Drawing
    
    var body: some View {
        Button {
            action()
            isFavorite.toggle()
        } label: {
            switch buttonStyle {
                
            case .circle:
                RoundedBadge(backgroundColor: buttonStyle.backgroundColor) {
                    image?.foregroundColor(buttonStyle.imageColor)
                }.shadow(radius: Locals.shadowRadius)
                
            case .rectangle:
                ZStack {
                    buttonStyle.backgroundColor
                    image?.foregroundColor(buttonStyle.imageColor)
                }.cornerRadius(10)
            }
        }
    }
}

struct AddFavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray).ignoresSafeArea()
            AddFavoriteButtonView(isFavorite: true, action: { })
        }
    }
}
