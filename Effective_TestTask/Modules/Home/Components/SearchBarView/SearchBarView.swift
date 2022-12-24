//
//  SearchBarView.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import SwiftUI

struct SearchBarView: View {
    
    // MARK: - Types
    
    enum Locals {
        static let stackSpacing: CGFloat = 10
        static let textFieldPadding: CGFloat = 10
        static let textFieldHorizontalPadding: CGFloat = 60
        static let textFieldCornerRadius: CGFloat = 50
        static let textFieldImageLeadingPadding: CGFloat = 24
        static let cancelImageTrailingPadding: CGFloat = 8
    }
    
    
    // MARK: - Properties
    
    @Binding
    var text: String
    
    @State
    private var isEditing = false
    
    let buttonAction: SimpleClosure
    
    
    // MARK: - Drawing
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: Locals.stackSpacing) {
                TextField("Search", text: $text)
                    .padding(Locals.textFieldPadding)
                    .padding(.horizontal, Locals.textFieldHorizontalPadding)
                    .background(Color(.white))
                    .cornerRadius(Locals.textFieldCornerRadius)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(
                                    UIConstants.BrandColor.button.color
                                )
                                .frame(
                                    minWidth: .zero,
                                    maxWidth: .infinity,
                                    alignment: .leading
                                )
                                .padding(
                                    .leading,
                                    Locals.textFieldImageLeadingPadding
                                )
                            
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                    UIApplication.shared.endEditing()
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(
                                            .trailing,
                                            Locals.cancelImageTrailingPadding
                                        )
                                }
                            }
                        }
                    )
                    .onTapGesture {
                        self.isEditing = true
                    }
                
                Button(action: buttonAction) {
                    RoundedBadge(
                        backgroundColor: UIConstants.BrandColor.button.color
                    ) {
                        Images.qrCode()?.image
                    }
                }.frame(width: proxy.size.height, height: proxy.size.height)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            UIConstants.BrandColor.background.color.ignoresSafeArea()
            SearchBarView(text: .constant(""), buttonAction: { })
                .frame(width: 400, height: 34)
        }
    }
}
