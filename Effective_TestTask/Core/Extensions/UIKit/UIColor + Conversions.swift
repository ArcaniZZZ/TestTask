//
//  UIColor + Conversions.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import SwiftUI

extension UIColor {
    
    var color: Color {
        .init(self)
    }
    
    /// Convert UIColor to UIImage
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
