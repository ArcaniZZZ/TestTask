//
//  TabBarMenuContainerView.swift
//  Effective_TestTask
//
//  Created by Arcani on 27.12.2022.
//

import SwiftUI

struct TabBarMenuContainerView<Content: View>: View {
    
    // MARK: - Properties
    
    let content: Content
    
    
    // MARK: - Drawing
    
    var body: some View {
        content
    }
}
