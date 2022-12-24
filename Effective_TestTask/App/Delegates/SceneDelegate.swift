//
//  SceneDelegate.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//


import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var applicationCoordinator: ApplicationCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            self.applicationCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
    }
}
