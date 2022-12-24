//
//  MainFlowCoordinator.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI

final class MainFlowCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var rootViewController = UINavigationController()
    
    var childCoordinators = [Coordinator]()
    
    let homeViewViewModel = HomeView.ViewModel(requestManager: RequestManager())
    
    
    // MARK: - Coordinator Protocol
    
    func start() {
        
        homeViewViewModel.didChooseProductAction = didChooseProduct
        
        let homeViewCoordinator = HomeViewCoordinator(homeViewViewModel: homeViewViewModel)
        
        homeViewCoordinator.start()
        childCoordinators.append(homeViewCoordinator)
        
        let viewController = homeViewCoordinator.rootViewController
        rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    func didChooseProduct() {
        
        let detailView = DetailView(
            viewModel: .init(
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
        
        let viewController = UIHostingController(rootView: detailView)
        
        rootViewController.pushViewController(viewController, animated: true)
        
        
    }
    
    
}

