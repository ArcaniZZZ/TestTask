//
//  DetailView.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Local Constants
    
    enum Locals {
        static let carouselImageCornerRadius: CGFloat = 20
        static let carouselImageAspectRatio = 1.26
        static let carouselSpacing: CGFloat = 30
        static let carouselWidthRatio = 0.64
        static let downscaleFactor = 0.9
        static let ratingColor = Color(.systemYellow)
    }
    
    @StateObject
    var viewModel: ViewModel
    
    @GestureState
    private var dragOffset: CGFloat = 0
    
    @State
    private var currentImageIndex = 0
    
    private var isFirstImage: Bool {
        currentImageIndex == 0
    }
    
    var body: some View {
        VStack {
            GeometryReader { outerView in
                
                let carouselImageWidth = outerView.size.width * Locals.carouselWidthRatio
                let carouselImageHeight = carouselImageWidth * Locals.carouselImageAspectRatio
                let scaledIHeight = carouselImageHeight * Locals.downscaleFactor
                let carouselLeadingPadding = (outerView.size.width - carouselImageWidth) / 2
                let xOffset = -CGFloat(self.currentImageIndex) * carouselImageWidth - Locals.carouselSpacing
                
                HStack(spacing: Locals.carouselSpacing) {
                    ForEach(viewModel.product.images.indices, id: \.self) { index in
                        AsyncImage(url: URL(string: viewModel.product.images[index])) { image in
                            image.resizable()
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(
                            width: carouselImageWidth,
                            height: index == currentImageIndex
                            ? carouselImageHeight
                            : scaledIHeight
                        )
                        .cornerRadius(Locals.carouselImageCornerRadius)
                        .shadow(radius: 20)
                    }
                }
                .frame(width: outerView.size.width, alignment: .leading)
                .padding(.horizontal, carouselLeadingPadding)
                .offset(x: isFirstImage ? xOffset + Locals.carouselSpacing : xOffset)
                .offset(x: self.dragOffset)
                .gesture(
                    DragGesture()
                        .updating(self.$dragOffset, body: { (value, state, transaction) in
                            state = value.translation.width
                        })
                        .onEnded({ value in
                            let threshold = outerView.size.width * 0.4
                            var newIndex = Int(-value.translation.width / threshold) + self.currentImageIndex
                            newIndex = min(max(newIndex, 0), viewModel.product.images.count - 1)
                            self.currentImageIndex = newIndex
                        })
                )
            }
            .padding(.top, 20)
            .padding(.bottom, 14)
            .animation(
                .interpolatingSpring(
                    mass: 0.6,
                    stiffness: 100,
                    damping: 10,
                    initialVelocity: 0.3
                ),
                value: dragOffset
            )
            
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Text(viewModel.product.title)
                            .font(UIConstants.BrandFont.semibold(24).font)
                            .foregroundColor(UIConstants.BrandColor.backgroundSecondary.color)
                        Spacer()
                        AddFavoriteButtonView(
                            buttonStyle: .rectangle,
                            isFavorite: viewModel.product.isFavorites,
                            action: didTapAddFavoriteButton
                        )
                        .frame(width: 37, height: 37)
                    }.padding(.bottom, 7)
                    
                    HStack {
                        RatingView(amount: 5, rating: Int(4.5), color: Locals.ratingColor)
                            .frame(height: 18)
                        Spacer()
                    }
                    
                    InfoTabView {
                        ShopTabView(
                            cpu: viewModel.product.CPU,
                            camera: viewModel.product.camera,
                            ssd: viewModel.product.ssd,
                            sd: viewModel.product.sd
                        ).tag(0)
                        
                        Text("🐯")
                            .font(BrandFontStyle.regular(70).font)
                            .tag(1)
                        
                        Text("🦊")
                            .font(BrandFontStyle.regular(70).font)
                            .tag(2)
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 30)
            .background(Color.white)
            .cornerRadius(30)
        }
        .background(UIConstants.BrandColor.background.color)
        .clipped()
    }
    
    private func didTapAddFavoriteButton() {}
    
    
}



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel:
                .init(
                    product: .init(
                        CPU: "M1",
                        camera: "12 mp",
                        capacity: ["128", "256"],
                        color: [],
                        id: "1",
                        images: [
                            "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
                            "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg",
                            "https://picsum.photos/200/302"
                        ],
                        isFavorites: true,
                        price: 1000,
                        rating: 4.5,
                        sd: "256 GB",
                        ssd: "8 GB",
                        title: "Galaxy Note 20 Ultra"
                    )
                )
        )
    }
}

