//
//  CommonViewController.swift
//  Effective_TestTask
//
//  Created by Arcani on 26.12.2022.
//

import SwiftUI

class CommonHostingViewController<Content: View>: UIHostingController<Content> {
    
    // MARK: - Types
    
    enum WrappedView {
        case home
        case detail(navigationAction: SimpleClosure)
        case cart
    }
    
    
    // MARK: - Properties
    
    private var shouldHideNavigationBar: Bool = false
    private let wrappedView: WrappedView
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawSelf()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupRightBarItem()
    }
    
    
    // MARK: - Init
    
    init(wrappedView: WrappedView, rootView: Content) {
        self.wrappedView = wrappedView
        super.init(rootView: rootView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Actions
    
    @objc private func rightBarButtonAction() {
        switch wrappedView {
        case .detail(let action):
            action()
        default:
            break
        }
    }
    
    
    // MARK: - Private methods
    
    private func drawSelf() {
        view.backgroundColor = BrandColor.background.value
    }
    
    private func setupNavigationBar() {
        
        switch wrappedView {
            
        case .home:
            shouldHideNavigationBar = true
        default:
            break
        }
        
        navigationController?.navigationBar.isHidden = shouldHideNavigationBar
        
        setTitle()
        setupRightBarItem()
        setBackButton()
    }
    
    private func setBackButton() {
        let backImage = Images.backBarButton()?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil
        )
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = BrandColor.background.value
    }
    
    private func setTitle() {
        switch wrappedView {
            
        case .detail:
            title = Texts.detailTitle
        default:
            break
        }
        
        let attributes = [NSAttributedString.Key.font: BrandFontStyle.semibold(18)]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
    private func setupRightBarItem() {
        
        var image: UIImage? = nil
        
        switch wrappedView {
        case .detail:
            image = Images.cartRigtBarButton()?.withRenderingMode(.alwaysOriginal)
        case .cart:
            image = Images.geoRightBarButton()?.withRenderingMode(.alwaysOriginal)
        case .home:
            break
        }
        
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.addTarget(
            self,
            action: #selector(rightBarButtonAction),
            for: .touchUpInside
        )
        
        let barButtonItem = UIBarButtonItem(customView: button)
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
}
