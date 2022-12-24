//
//  FilterBottomSheetView.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//

import SwiftUI

struct FilterBottomSheetView: View {
    
    // MARK: - Types
    
    enum Locals {
        static let doneButtonSize = CGSize(width: 86, height: 37)
    }
    
    var model: Model
    
    // MARK: - Properties
    
    /// Mock data
    @State
    private var currentBrand = "Apple"
    
    /// Mock data
    @State
    private var currentPrice = "$300 - $500"
    
    /// Mock data
    @State
    private var currentSize = "4.5 to 5.5 inches"
    
    
    // MARK: - Drawing
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Text(Texts.filterBottomSheetTitle)
                        .font(BrandFontStyle.semibold(17).font)
                        .foregroundColor(UIConstants.BrandColor.backgroundSecondary.color)
                }
                
                HStack {
                    SquareButtonView(
                        buttonAction: model.cancelButtonAction,
                        image: Images.cancelCross()?.image
                    )
                    Spacer()
                    RoundedRectangleButtonView(
                        title: Texts.filterBottomSheetDoneButtonTitle,
                        action: { }
                    ).frame(Locals.doneButtonSize)
                    
                }
            }.padding(.bottom, 30)
            
            HStack {
                Text(Texts.filterBottomSheetBrandTitle)
                    .font(BrandFontStyle.semibold(17).font)
                    .foregroundColor(UIConstants.BrandColor.backgroundSecondary.color)
                Spacer()
            }.padding(.bottom, 5)
            
            
            Menu {
                Button(action: { currentBrand = "Xiaomi" }) {
                    Text("Xiaomi")
                }
                Button(action: { currentBrand = "Samsung" }) {
                    Text("Samsung")
                }
                Button(action: { currentBrand = "Apple" }) {
                    Text("Apple")
                }
            } label: {
                FilterView(filterText: currentBrand)
            }.padding(.bottom, 10)
            
            HStack {
                Text(Texts.filterBottomSheetBrandTitle)
                    .font(BrandFontStyle.semibold(17).font)
                    .foregroundColor(UIConstants.BrandColor.backgroundSecondary.color)
                Spacer()
            }.padding(.bottom, 5)
            
            
            Menu {
                Button(action: { currentPrice = "$1000 - $5009" }) {
                    Text("$1000 - $5009")
                }
                Button(action: { currentPrice = "$500 - $1000" }) {
                    Text("$500 - $1000")
                }
                Button(action: { currentPrice = "$300 - $500" }) {
                    Text("$300 - $500")
                }
            } label: {
                FilterView(filterText: currentPrice)
            }.padding(.bottom, 10)
            
            HStack {
                Text(Texts.filterBottomSheetBrandTitle)
                    .font(BrandFontStyle.semibold(17).font)
                    .foregroundColor(UIConstants.BrandColor.backgroundSecondary.color)
                Spacer()
            }.padding(.bottom, 5)
            
            
            Menu {
                Button(action: { currentSize = "6.5 to 7.0 inches" }) {
                    Text("6.5 to 7.0 inches")
                }
                Button(action: { currentSize = "5.5 to 6.5 inches" }) {
                    Text("5.5 to 6.5 inches")
                }
                Button(action: { currentSize = "4.5 to 5.5 inches" }) {
                    Text("4.5 to 5.5 inches")
                }
            } label: {
                FilterView(filterText: currentSize)
            }
        }.padding(.horizontal, 30)
    }
}


// MARK: - Model
extension FilterBottomSheetView {
    
    struct Model {
        
        var cancelButtonAction: SimpleClosure
        let doneButtonAction: SimpleClosure
        
    }
}
