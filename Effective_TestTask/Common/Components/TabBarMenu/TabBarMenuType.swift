//
//  TabBarMenuType.swift
//  Effective_TestTask
//
//  Created by Arcani on 27.12.2022.
//

import SwiftUI

enum TabBarMenuType {
    case homeViewTabBar(model: HomeViewTabBarView.Model)
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .homeViewTabBar(let model): HomeViewTabBarView(model: model)
        }
    }
}
