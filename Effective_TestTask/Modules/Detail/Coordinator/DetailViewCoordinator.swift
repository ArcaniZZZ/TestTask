//
//  DetailViewCoordinator.swift
//  Effective_TestTask
//
//  Created by Arcani on 26.12.2022.
//

import SwiftUI

final class DetailViewCoordinator: Coordinator {
    func openDetailModule() {    }
    
    func openCartModule() { }
    

    // MARK: - Properties
    
    var rootViewController = UIViewController()
    
    private let detailViewModel: DetailView.ViewModel
    private let navigationAction: SimpleClosure
    
    
    // MARK: - Init
    
    init(
        detailViewModel: DetailView.ViewModel,
        navigationAction: @escaping SimpleClosure
    ) {
        self.detailViewModel = detailViewModel
        self.navigationAction = navigationAction
    }
    

    // MARK: - Coordinator Protocol
    
    func start() {
        let view = DetailView(viewModel: self.detailViewModel)
        rootViewController = CommonHostingViewController(
            wrappedView: .detail(navigationAction: navigationAction),
            rootView: view
        )
    }
}
