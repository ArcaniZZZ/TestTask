//
//  CarouselBannerContainerView.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import SwiftUI

struct CarouselBannerContainerView: View {
    
    // MARK: - Properties
    
    let model: Model
    
    @GestureState private var dragOffset: CGFloat = 0
    @State private var currentBannerIndex = 0
    
    
    // MARK: - Drawing
    
    var body: some View {
        
        GeometryReader { outerView in
            HStack(spacing: 0) {
                ForEach(model.banners.indices, id: \.self) { index in
                    
                    let currentBanner = model.banners[index]
                    
                    GeometryReader { innerView in
                        CarouselBannerView(
                            model: .init(
                                title: currentBanner.title,
                                subtitle: currentBanner.subtitle,
                                buttonTitle: "Buy Now!",
                                buttonAction: { },
                                imageURL: currentBanner.picture,
                                isNew: currentBanner.isNew ?? false
                            )
                        )
                    }
                    .padding(.horizontal)
                    .frame(width: outerView.size.width, height: 182)
                }
            }
            .frame(width: outerView.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentBannerIndex) * outerView.size.width)
            .offset(x: self.dragOffset)
            .gesture(
                DragGesture()
                    .updating(self.$dragOffset, body: { (value, state, transaction) in
                        state = value.translation.width
                    })
                    .onEnded({ (value) in
                        let threshold = outerView.size.width * 0.65
                        var newIndex = Int(-value.translation.width / threshold) + self.currentBannerIndex
          
                        newIndex = min(max(newIndex, 0), model.banners.count - 1)
                        self.currentBannerIndex = newIndex
                    })
            )
        }.animation(
            .interpolatingSpring(
                mass: 0.6,
                stiffness: 100,
                damping: 10,
                initialVelocity: 0.3
            ), value: dragOffset
        )
        
    }
}

// MARK: - Model
extension CarouselBannerContainerView {
    
    struct Model {
        let banners: [FeaturedProduct]
    }
}

struct CarouselBannerContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselBannerContainerView(
            model: .init(
                banners: [
                    .init(
                        id: 1,
                        isNew: true,
                        title: "iPhone 12",
                        subtitle: "Super. Mega. Rapido",
                        picture:
                            "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&;amp;h=420&amp;mode=crop&amp;scale=both",
                        isBuy: true),
                    .init(
                        id: 2,
                        isNew: true,
                        title: "Xiaomi 13",
                        subtitle: "Super. Mega. Rapido",
                        picture:
                            "https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg",
                        isBuy: true),
                    .init(
                        id: 3,
                        isNew: false,
                        title: "Samsung 14",
                        subtitle: "Super. Mega. Rapido",
                        picture:
                            "https://static.digit.in/default/942998b8b4d3554a6259aeb1a0124384dbe0d4d5.jpeg",
                        isBuy: true)
                ]
            )
        )
    }
}
