//
//  ContentView.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    private let requestManager = RequestManager()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
