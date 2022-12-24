//
//  RatingView.swift
//  Effective_TestTask
//
//  Created by Arcani on 24.12.2022.
//

import SwiftUI

struct RatingView: View {
    
    // MARK: - Properties
    
    let amount: Int
    let rating: Int
    let color: Color
    

    // MARK: - Init
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(1...amount, id: \.self) { index in
                index > rating
                ? Image(systemName: "star")
                    .foregroundColor(color)
                : Image(systemName: "star.fill")
                    .foregroundColor(color)
            }
        }
    }
}
