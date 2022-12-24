//
//  SquareButtonView.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//

import SwiftUI

struct SquareButtonView: View {
    
    // MARK: - Local Constants
    
    enum Locals {
        static let buttonSize = CGSize(width: 37, height: 37)
        static let cornerRadius: CGFloat = 10
    }
    
    
    // MARK: - Properties
    
    let buttonAction: SimpleClosure
    let image: Image?
    
    
    // MARK: - Drawing
    
    var body: some View {
        Button(action: buttonAction) {
            image
        }
        .frame(Locals.buttonSize)
        .background {
            UIConstants.BrandColor.backgroundSecondary.color
        }
        .cornerRadius(Locals.cornerRadius)
    }
}

struct CancelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SquareButtonView(buttonAction: { }, image: Images.cancelCross()?.image)
    }
}
