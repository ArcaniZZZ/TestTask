//
//  HomeView.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Types
    
    enum Locals {
        
        static let commonBottomPadding: CGFloat = 24
        static let searchBarViewHeight: CGFloat = 34
        static let bestSellerCellHeight: CGFloat = 227
        static let bestSellerCellSpacing: CGFloat = 8
        static let carouselBannerHeight: CGFloat = 190
        static let gridRowSpacing: CGFloat = 12
        static let tabBarHeight: CGFloat = 94
        static let filterSheetHeight: CGFloat = 375
        
    }
    
    
    // MARK: - Properties
    
    @StateObject var viewModel: ViewModel
    @State private var searchFieldText = ""
    @State private var isShowingFiltersSheet = false
    
    private let requestManager = RequestManager()
    private let gridItemLayout = [
        GridItem(.flexible(),spacing: Locals.bestSellerCellSpacing),
        GridItem(.flexible(),spacing: Locals.bestSellerCellSpacing),
    ]
    
    
    // MARK: - Drawing
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationView(buttonAction: didTapFilterButton)
                .padding(.bottom, Locals.commonBottomPadding)
            ScrollView(showsIndicators: false) {
                VStack(spacing: .zero) {
                    
                    TitleView(
                        title: Texts.homeScreenSelectCategory,
                        buttonTitle: Texts.homeScreenViewAllButtonTitle,
                        buttonAction: didTapViewAllButton
                    )
                    .padding(.bottom, Locals.commonBottomPadding)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 25) {
                            ForEach(viewModel.categories) { category in
                                CategoryView(
                                    model: .init(
                                        isChosen: category.isChosen,
                                        imageName: category.categoryType.rawValue + "Icon",
                                        title: category.categoryType.rawValue
                                    )
                                ).onTapGesture {
                                    viewModel.didChooseCategory(category)
                                }
                            }
                        }.padding(.horizontal)
                    }.padding(.bottom, Locals.commonBottomPadding)
                    
                    SearchBarView(text: $searchFieldText, buttonAction: didTapQRButton)
                        .frame(height: Locals.searchBarViewHeight)
                        .padding(.horizontal)
                        .padding(.bottom, Locals.commonBottomPadding)
                    
                    TitleView(
                        title: Texts.homeScreenHotSales,
                        buttonTitle: Texts.homeScreenSeeMoreButtonTitle,
                        buttonAction: didTapSeeMoreButton
                    )
                    .padding(.bottom, Locals.commonBottomPadding)
                    
                    CarouselBannerContainerView(
                        model: .init(banners: viewModel.mainScreenModel?.homeStore ?? [])
                    )
                    .frame(height: Locals.carouselBannerHeight)
                    .padding(.bottom, Locals.commonBottomPadding)
                    
                    TitleView(
                        title: Texts.homeScreenBestSellers,
                        buttonTitle: Texts.homeScreenSeeMoreButtonTitle,
                        buttonAction: didTapSeeMoreButton
                    )
                    .padding(.bottom, Locals.commonBottomPadding)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: gridItemLayout, spacing: Locals.gridRowSpacing) {
                            if let bestSellers = viewModel.mainScreenModel?.bestSeller {
                                ForEach((bestSellers.indices), id: \.self) { index in
                                    BestSellerView(
                                        model: .init(
                                            imageURL: bestSellers[index].picture,
                                            discountedPrice: bestSellers[index].discountPrice.formatAsPrice(currencyCode: "USD"),
                                            originalPrice: bestSellers[index].priceWithoutDiscount.formatAsPrice(currencyCode: "USD"),
                                            title: bestSellers[index].title
                                        ),
                                        isFavorite: bestSellers[index].isFavorites,
                                        didTapFavoriteButtonAction: didTapFavoriteButton
                                    )
                                    .frame(height: Locals.bestSellerCellHeight)
                                    .onTapGesture {
                                        viewModel.didChooseProduct()
                                    }
                                }
                            }
                        }
                    }.padding(.horizontal)
                    
                    Spacer().frame(height: Locals.tabBarHeight)
                    
                }
            }
            .bottomSheet(
                viewModel: .init(
                    height: Locals.filterSheetHeight,
                    bottomSheetType: .filterBottomSheet(
                        model: .init(
                            cancelButtonAction: didTapCloseFilterSheetButton,
                            doneButtonAction: { }
                        )
                    )
                ),
                isShowing: $isShowingFiltersSheet
            )
            .refreshable {
                Task {
                    try? await viewModel.viewIsReady()
                }
            }
            .padding(.horizontal)
            .task {
                try? await viewModel.viewIsReady()
            }
        }
        .tabBarMenu(
            viewModel: .init(
                bottomSheetType: .homeViewTabBar(
                    model: .init(
                        cartButtonAction: viewModel.didTapTabBarCartButton,
                        numberOfProductsInCart: viewModel.numberOfProductsInCart
                    )
                )
            )
        )
        .padding(.top, 25)
        .background(UIConstants.BrandColor.background.color)
    }
    
    
    
    // MARK: - Private Methods
    
    private func didTapCloseFilterSheetButton() {
        isShowingFiltersSheet = false
    }
    private func didTapFavoriteButton() { }
    private func didTapQRButton() { }
    private func didTapViewAllButton() { }
    private func didTapSeeMoreButton() { }
    private func didTapFilterButton() {
        isShowingFiltersSheet.toggle()
    }
}

