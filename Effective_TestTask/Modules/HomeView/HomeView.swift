//
//  HomeView.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

import SwiftUI

struct HomeView: View {
    
    let color = Color(red: 0.96, green: 0.96, blue: 0.96)
    
    private let requestManager = RequestManager()
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            NavigationView()
            TitleView()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(viewModel.categories) { category in
                        CategoryView(
                            model: .init(
                                isChosen: category.isChosen,
                                imageName: category.categoryType.rawValue + "Icon"
                            )
                        ).onTapGesture {
                            viewModel.didChooseCategory(category)
                        }
                    }
                }.padding(.horizontal)
            }
            Spacer()
        }.background(Color(red: 0.96, green: 0.96, blue: 0.96).ignoresSafeArea())
    }
    
}

struct LocationView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("locationPin")
            Text("Zihuatanejo, Gro")
            Image("dropDownArrow")
        }
    }
}

struct NavigationView: View {
    var body: some View {
        ZStack {
            HStack {
                LocationView()
            }
            HStack {
                Spacer()
                Image("filter")
                    .padding()
            }
        }
    }
}

struct TitleView: View {
    var body: some View {
        HStack {
            Text("Select Category")
                .font(.system(size: 25))
                .fontWeight(.bold)
            Spacer()
            Text("view all")
                .font(.system(size: 15))
            
        }.padding(.horizontal)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(requestManager: RequestManager()))
    }
}

