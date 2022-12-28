//
//  Coordinator.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//


protocol Coordinator {
    func start()
}

protocol MainFlowCoordinator: Coordinator, AnyObject {
    func openDetailModule()
    func openCartModule()
}
