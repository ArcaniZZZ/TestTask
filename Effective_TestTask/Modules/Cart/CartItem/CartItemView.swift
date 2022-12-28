//
//  CartItemView.swift
//  Effective_TestTask
//
//  Created by Arcani on 28.12.2022.
//

import SwiftUI

struct CartItemView: View {
    
    // MARK: - Properties
    
    let imageUrl: String
    let title: String
    let price: String


    // MARK: - Drawing
    
    var body: some View {
        HStack(spacing: 0) {
            
            AsyncImage(url: URL(string: imageUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .squaredFrame(squareSide: 88)
            .cornerRadius(10)
            
            Spacer().frame(width: 17)
            
            HStack {
                VStack {
                    Text(title)
                        .foregroundColor(.white)
                        .font(BrandFontStyle.semibold(20).font)
                        .lineLimit(2, reservesSpace: true)
                        .frame(width: 153, alignment: .leading)
                    Text(price)
                        .foregroundColor(BrandColor.button.color)
                        .font(BrandFontStyle.semibold(20).font)
                        .frame(width: 153, alignment: .leading)
                }
                .frame(maxHeight: .infinity)
                .frame(alignment: .leading)
                
                Spacer().frame(width: 17)
                
                VStack {
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .squaredFrame(squareSide: 8)
                    }
                    
                    Text("\(0)")
                        .foregroundColor(.white)
                        .font(BrandFontStyle.semibold(20).font)
           
                    Button(action: {}) {
                        Image(systemName: "minus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 8, height: 1)
                 
                    }
                }
                
                .frame(width: 25)
                .frame(height: 70)
                .background(Color.white.opacity(0.25))
                .cornerRadius(26)
            }
            
            
            Spacer().frame(width: 17)
            
            Button(action: {}) {
                Image(systemName: "trash")
                    .foregroundColor(Color.white.opacity(0.25))
                    .frame(width: 15)
            }
        }
        .padding(.horizontal, 5)
        .background(BrandColor.backgroundSecondary.color)
    }
    
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(
            imageUrl: "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg",
            title: "Galaxy Note 20 Ultra",
            price: 3000.formatAsPrice(currencyCode: "USD")
        ).frame(height: 90)
    }
}
