//
//  CartView.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI

struct CartView: View {
    
    // MARK: - Properties
    
    @ObservedObject
    private var viewModel: ViewModel
    
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    
    // MARK: - Init
    
    var body: some View {
        Text("!!!!! \(viewModel.productsCount) !!!!!")
    }
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//    }
//}
