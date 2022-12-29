//
//  UIImage + Conversions.swift
//  Effective_TestTask
//
//  Created by Arcani on 22.12.2022.
//

import SwiftUI

extension UIImage {
    
    /// Converts UIImage to Image.
    var image: Image {
        .init(uiImage: self)
    }
}
