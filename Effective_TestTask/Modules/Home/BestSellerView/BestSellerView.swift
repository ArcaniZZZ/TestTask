//
//  BestSellerView.swift
//  Effective_TestTask
//
//  Created by Arcani on 19.12.2022.
//

import SwiftUI

struct BestSellerView: View {
    
    // MARK: - Properties
    
    let model: Model
    let isFavorite: Bool
    let didTapFavoriteButtonAction: SimpleClosure
    
    
    // MARK: - Drawing
    
    var body: some View {
        GeometryReader { outerView in
            VStack(spacing: 0) {
                ZStack {
                    AsyncImage(url: URL(string: model.imageURL ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        GeometryReader { proxy in
                            ProgressView()
                                .frame(width: proxy.size.width, height: proxy.size.height)
                        }
                    }
                    .padding(.top, 5)
                    
                    HStack {
                        Spacer()
                        VStack {
                            AddFavoriteButtonView(
                                isFavorite: isFavorite,
                                action: didTapFavoriteButtonAction
                            ).frame(width: 25, height: 25)
                            Spacer()
                        }
                        .padding(.top, 10)
                        .padding(.trailing, 16)
                    }
                }
                
                HStack(alignment: .lastTextBaseline) {
                    Text(model.discountedPrice ?? "")
                        .font(
                            BrandFontStyle.bold(
                                ScreenSize.isSE3GenAndSmaller ? 10 : 16
                            )
                            .font
                        )
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text(model.originalPrice ?? "")
                        .strikethrough()
                        .font(
                            BrandFontStyle.regular(
                                ScreenSize.isSE3GenAndSmaller ? 8 : 10
                            )
                            .font
                        )
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom, 5)
                
                HStack {
                    Text(model.title ?? "")
                        .font(BrandFontStyle.regular(10).font)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.bottom, 15)
                .padding(.horizontal)
            }
            
        }
        .background(.white)
        .cornerRadius(10)
    }
}


extension BestSellerView {
    
    struct Model {
        let imageURL: String?
        let discountedPrice: String?
        let originalPrice: String?
        let title: String?
    }
    
}

struct BestSellerView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerView(
            model: .init(
                imageURL: "https://picsum.photos/400/177",
                discountedPrice: "$1000",
                originalPrice: "$2000",
                title: "Samsung Galaxy s20 Ultra"
            ),
            isFavorite: true,
            didTapFavoriteButtonAction: { }
        )
    }
}
