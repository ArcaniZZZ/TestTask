//
//  HomeViewTabBarView.swift
//  Effective_TestTask
//
//  Created by Arcani on 27.12.2022.
//

import SwiftUI

struct HomeViewTabBarView: View {
    
    // MARK: - Properties
    
    let model: Model
    
    
    // MARK: - Drawing
    
    var body: some View {
                HStack(
                    spacing: ScreenSize.isSE3GenAndSmaller ? 30 : 52
                ) {
  
            Button(action: {}) {
                HStack(spacing: 7) {
                    Circle()
                        .squaredFrame(squareSide: 8)
                        .foregroundColor(.white)
                    Text(Texts.homeScreenTabBarRating)
                        .font(BrandFontStyle.bold(15).font)
                        .foregroundColor(.white)
                }
            }
            
            Button(action: model.cartButtonAction) {
                HStack(spacing: 0) {
                    Images.cartIcon()?.image
                        .resizable()
                        .frame(width: 17, height: 17)
                    
                    if model.numberOfProductsInCart > 0 {
                        VStack {
                            Text("\(model.numberOfProductsInCart)")
                                .font(BrandFontStyle.regular(10).font)
                                .padding(.horizontal, 3)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                        .foregroundColor(BrandColor.button.color)
                                )
                            Spacer()
                        }
                        
                    }
                    
                }
                
                
            }
            .frame(maxWidth: 42)
            .frame(height: 17)
            
            Button(action: {}) {
                Images.heartBlank()?.image
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 19, height: 17)
            }
            
            Button(action: {}) {
                Images.personIcon()?.image
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 17, height: 17)
            }
        }
        .frame(height: 72)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(BrandColor.backgroundSecondary.color)
        )
    }
}


// MARK: - Model
extension HomeViewTabBarView {
    
    struct Model {
        // TODO: - Implement other actions
        let cartButtonAction: SimpleClosure
        let numberOfProductsInCart: Int
    }
    
}

//struct HomeViewTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeViewTabBarView(model: .init(cartButtonAction: {}, numberOfProductsInCart: .))
//    }
//}
