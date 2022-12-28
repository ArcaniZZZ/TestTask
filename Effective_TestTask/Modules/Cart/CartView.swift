//
//  CartView.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI

struct CartView: View {
    
    // MARK: - Properties
    
    @ObservedObject
    private var viewModel: ViewModel
    
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    
    // MARK: - Init
    
    var body: some View {
        
        VStack {
            
            /// Title
            HStack {
                Text(Texts.cartTitle)
                    .font(BrandFontStyle.bold(35).font)
                    .foregroundColor(BrandColor.backgroundSecondary.color)
                    .padding(.vertical, 50)
                    .padding(.horizontal, 42)
                Spacer()
            }.background(BrandColor.background.color)
            
            
            /// Cart
            
            VStack {
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.productsInCart, id: \.self) { product in
                            CartItemView(
                                imageUrl: product.images,
                                title: product.title,
                                price: product.price.formatAsPrice(currencyCode: "USD")
                            ).padding(.bottom, 45)
                        }
                        
                    }
                    .padding(.top, 80)
                    .padding(.horizontal, 34)
                    
                }
                
                .cornerRadius(30)
                .ignoresSafeArea()
                
                
                VStack(spacing: 0) {
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color.white.opacity(0.25))
                        .padding(.bottom, 15)
                    
                    HStack {
                        Text(Texts.cartTotal)
                            .foregroundColor(.white)
                            .font(BrandFontStyle.regular(15).font)
                        Spacer()
                        Text(viewModel.total.formatAsPrice(currencyCode: "USD"))
                            .foregroundColor(.white)
                            .font(BrandFontStyle.bold(15).font)
                    }
                    .padding(.horizontal, 50)
                    .padding(.bottom, 12)
                    
                    HStack {
                        Text(Texts.cartDelivery)
                            .foregroundColor(.white)
                            .font(BrandFontStyle.regular(15).font)
                        Spacer()
                        Text(viewModel.deliveryPrice)
                            .foregroundColor(.white)
                            .font(BrandFontStyle.bold(15).font)
                    }
                    .padding(.horizontal, 50)
                    .padding(.bottom, 26)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.white.opacity(0.25))
                        .padding(.bottom, 28)
                    
                    RoundedRectangleButtonView(
                        title: Texts.cartCheckoutButtonTitle, action: { }
                    )
                        .frame(width: 326, height: 54)
                        .padding(.bottom, 44)
                }
                
            }
            
            .background(BrandColor.backgroundSecondary.color)
            .cornerRadius(30)
            .ignoresSafeArea(edges: [.bottom])
        }
       
        .task {
            try? await viewModel.viewIsReady()
        }
    }
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//    }
//}
