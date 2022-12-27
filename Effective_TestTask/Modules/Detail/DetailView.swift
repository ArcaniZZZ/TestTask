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
        static let carouselImageAspectRatio = 1.3
        static let carouselSpacing: CGFloat = 30
        static var carouselWidthRatio: CGFloat {
            ScreenSize.isSE3GenAndSmaller ? 1.6 : 1.5
        }
        static let downscaleFactor = 0.9
        static let ratingColor = Color(.systemYellow)
    }
    
    
    // MARK: - Properties
    
    @StateObject
    var viewModel: DetailView.ViewModel
    
    @GestureState
    private var dragOffset: CGFloat = 0
    
    @State
    private var currentImageIndex = 0
    
    private var isFirstImage: Bool {
        currentImageIndex == 0
    }
    
    
    // MARK: - Drawing
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                GeometryReader { outerView in
                    let carouselImageWidth = outerView.size.width / Locals.carouselWidthRatio
                    let carouselImageHeight = carouselImageWidth * Locals.carouselImageAspectRatio
                    let scaledIHeight = carouselImageHeight * Locals.downscaleFactor
                    let carouselLeadingPadding = (outerView.size.width - carouselImageWidth) / 2
                    let xOffset = -CGFloat(self.currentImageIndex) * carouselImageWidth - Locals.carouselSpacing
                    
                    HStack(spacing: Locals.carouselSpacing) {
                        
                        if let images = viewModel.product?.images {
                            
                            ForEach(images.indices, id: \.self) { index in
                                AsyncImage(url: URL(string: images[index])) { image in
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
                                .shadow(radius: 5, x: 0, y: 5)
                            }
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
                                newIndex = min(max(newIndex, 0), (viewModel.product?.images.count ?? 1) - 1)
                                self.currentImageIndex = newIndex
                            })
                    )
                }
                .frame(height: ScreenSize.isSE3GenAndSmaller ? 300 : 350)
                .padding(.top, 20)
                .padding(.bottom, ScreenSize.isSE3GenAndSmaller ? 10 : 20)
                .animation(
                    .interpolatingSpring(
                        mass: 0.6,
                        stiffness: 100,
                        damping: 10,
                        initialVelocity: 0.3
                    ),
                    value: dragOffset
                )
                
                LazyVStack {
                    HStack {
                        Text(viewModel.product?.title ?? "")
                            .font(UIConstants.BrandFont.semibold(24).font)
                            .foregroundColor(UIConstants.BrandColor.backgroundSecondary.color)
                        
                        Spacer()
                        
                        AddFavoriteButtonView(
                            buttonStyle: .rectangle,
                            isFavorite: viewModel.product?.isFavorites ?? false,
                            action: didTapAddFavoriteButton
                        )
                        .frame(width: 37, height: 37)
                    }
                    .padding(.top, 28)
                    .padding(.bottom, 7)
                    
                    HStack {
                        RatingView(amount: 5, rating: Int(4.5), color: Locals.ratingColor)
                            .frame(height: 18)
                        Spacer()
                    }.padding(.bottom, ScreenSize.isSE3GenAndSmaller ? 20 : 30)
                    
                    InfoTabView {
                        ShopTabView(
                            cpu: viewModel.product?.cpu,
                            camera: viewModel.product?.camera,
                            ssd: viewModel.product?.ssd,
                            sd: viewModel.product?.sd
                        )
                        .tag(0)
                        
                        Text("🐯")
                            .font(BrandFontStyle.regular(70).font)
                            .tag(1)
                        
                        Text("🦊")
                            .font(BrandFontStyle.regular(70).font)
                            .tag(2)
                    }.padding(.bottom, ScreenSize.isSE3GenAndSmaller ? 20 : 30)
                    
                    HStack {
                        Text(Texts.detailSelectColorAndCapacity)
                            .foregroundColor(BrandColor.backgroundSecondary.color)
                            .font(BrandFontStyle.semibold(16).font)
                        Spacer()
                    }.padding(.bottom, 15)
                    
                    HStack {
                        ScrollView {
                            LazyHStack(spacing: 18) {
                                ForEach(viewModel.productColors ?? [], id: \.self) { color in
                                    ColoredCircleButton(isChosen: color.isChosen, color: color.hex)
                                        .onTapGesture {
                                            viewModel.didChooseColor(color.hex)
                                        }
                                }
                            }
                        }
                        
                        Spacer()
                        
                        ScrollView {
                            HStack(spacing: 5) {
                                ForEach(viewModel.productCapacities ?? [], id: \.self) { capacity in
                                    CapacityView(capacity: capacity.capacity, isChosen: capacity.isChosen)
                                        .onTapGesture {
                                            viewModel.didChooseCapacity(capacity.capacity)
                                        }
                                }
                            }.padding(.vertical, 5)
                        }
                    }.padding(.bottom, 26)
                    
                    RoundedRectangleButtonView(
                        title:
                            Texts.detailsAddToCartButtonTitle + "   " +
                            (viewModel.product?.price.formatAsPrice(currencyCode: "USD") ?? ""),
                        action: didTapAddToCartButton
                    )
                    .frame(height: 54)
                    .padding(.bottom, 30)
                }
                
                .padding(.horizontal, 40)
                .background(Color.white)
                .cornerRadius(30)
            }
            .background(UIConstants.BrandColor.background.color)
        }.task {
            try? await viewModel.fetchProduct()
        }
    }
    
    
    // MARK: - Private Methods
    
    private func didTapAddFavoriteButton() {}
    private func didTapAddToCartButton() {
        viewModel.didTapAddToCartButton()
    }
    
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(viewModel:
//                .init(
//                    product: .init(
//                        CPU: "M1",
//                        camera: "12 mp",
//                        capacity: ["128", "256"],
//                        color: [
//                            "#772D03",
//                            "#010035"
//                        ],
//                        id: "1",
//                        images: [
//                            "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
//                            "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg",
//                            "https://picsum.photos/200/302"
//                        ],
//                        isFavorites: true,
//                        price: 1000,
//                        rating: 4.5,
//                        sd: "256 GB",
//                        ssd: "8 GB",
//                        title: "Galaxy Note 20 Ultra"
//                    )
//                )
//        )
//    }
//}

