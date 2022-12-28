//
//  View + Customizing.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import SwiftUI

extension View {
    
    /// Creates frame with CGSize.
    func frame(_ size: CGSize? = nil, alignment: Alignment = .center) -> some View {
        frame(width: size?.width, height: size?.height, alignment: alignment)
    }
    
    /// Creates square frame.
    func squaredFrame(squareSide: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: squareSide, height: squareSide, alignment: alignment)
    }
}
