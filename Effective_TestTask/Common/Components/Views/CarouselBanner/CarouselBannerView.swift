//
//  CarouselBannerView.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import SwiftUI

struct CarouselBannerView: View {
    
    // MARK: - Properties
    
    let model: Model
    
    
    // MARK: - Drawing
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: model.imageURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.cornerRadius(10)
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    
                    RoundedBadge {
                        Text(Texts.carouselBannerNewBadgeTitle)
                            .font(BrandFontStyle.bold(10).font)
                            .padding(.horizontal, 2)
                    }
                    .frame(width: 27, height: 27)
                    .padding(.top, 14)
                    .padding(.bottom, 18)
                    .opacity(model.isNew ? 1 : 0)
        
                    Text(model.title)
                        .font(BrandFontStyle.bold(25).font)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    
                    Text(model.subtitle)
                        .font(BrandFontStyle.bold(11).font)
                        .foregroundColor(.white)
                        .padding(.bottom, 26)
                    
                    RoundedRectangleButtonView(
                        title: model.buttonTitle,
                        style: .secondary,
                        action: model.buttonAction
                    ).frame(width: 98, height: 23)
                    
                    Spacer()
                    
                }
                .padding(.leading, 17)
                
                Spacer()
            }
        }
    }
}


extension CarouselBannerView {
    
    struct Model {
        
        let title: String
        let subtitle: String
        let buttonTitle: String
        let buttonAction: SimpleClosure
        let imageURL: String
        let isNew: Bool
        
    }
    
}



struct CarouselBannerView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselBannerView(
            model: .init(
                title: "iPhone 12",
                subtitle: "Super. Mega. Rapido.",
                buttonTitle: "Buy now!",
                buttonAction: { },
                imageURL: "https://picsum.photos/380/182",
                isNew: true
            )
        )
        
    }
}
