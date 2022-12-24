//
//  NavigationView.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//

import SwiftUI

struct NavigationView: View {
    
    // MARK: - Properties
    
    let buttonAction: () -> Void
    
    
    // MARK: - Drawing
    
    var body: some View {
        ZStack {
            HStack {
                LocationView()
            }
            HStack {
                Spacer()
                Button(action: buttonAction) {
                    Images.filter()?.image
                        .padding(.trailing, 36)
                }
            }
        }
    }
}
