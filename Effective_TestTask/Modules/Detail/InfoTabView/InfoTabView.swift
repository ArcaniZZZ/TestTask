//
//  InfoTabView.swift
//  Effective_TestTask
//
//  Created by Arcani on 24.12.2022.
//

import SwiftUI

struct InfoTabView<Content: View>: View {
    
    // MARK: - Properties
    
    @State
    private var selection = 0
    
    @ViewBuilder
    var content: Content
    
    
    // MARK: - Init
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    // MARK: - Drawing
    
    var body: some View {
        VStack {
            GeometryReader { outerView in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        TabTextView(
                            currentSelection: $selection,
                            title: Texts.detailShoTabTitle,
                            tag: 0
                        )
                        .frame(width: outerView.size.width / 3)
                        TabTextView(
                            currentSelection: $selection,
                            title: Texts.detailsTabTitle,
                            tag: 1
                        )
                        .frame(width: outerView.size.width / 3)
                        TabTextView(
                            currentSelection: $selection,
                            title: Texts.detailFeatureTabTitle,
                            tag: 2
                        )
                        .frame(width: outerView.size.width / 3)
                        
                    }
                    .frame(width: outerView.size.width)
                    .padding(.bottom, 8)
                    
                    Rectangle().frame(width: outerView.size.width / 3, height: 3)
                        .offset(
                            x: calculateXOffset(
                                viewWidth: outerView.size.width,
                                barWidth: outerView.size.width * 0.2
                            )
                        )
                        .foregroundColor(BrandColor.button.color)
                        .animation(
                            .interpolatingSpring(
                                mass: 1,
                                stiffness: 100,
                                damping: 100,
                                initialVelocity: 1
                            ),
                            value: selection
                        )
                        .padding(.bottom, 32)
                }.frame(width: outerView.size.width)
            }
            .frame(height: 34)
            
            TabView(selection: $selection) {
                content
            }
            .frame(height: 60)
            .padding(.top, 32)
   
            .animation(
                .interpolatingSpring(
                    mass: 1,
                    stiffness: 100,
                    damping: 100,
                    initialVelocity: 1
                ),
                value: selection
            )
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            Spacer()
        }
    }
    
    
    // MARK: - Private Methods
    
    private func calculateXOffset(
        viewWidth: CGFloat,
        barWidth: CGFloat
    ) -> CGFloat {
        
        let offset = barWidth / 1.3
        let halfViewWidth = viewWidth / 2
        
        if selection == 0 {
            return -halfViewWidth + offset
        } else if selection == 1 {
            return 0
        } else {
            return halfViewWidth - offset
        }
    }
    
}

struct InfoTabView_Previews: PreviewProvider {
    static var previews: some View {
        InfoTabView {
            Text("🦄")
                .font(.system(size: 200))
                .tag(0)
            Text("🐱")
                .font(.system(size: 200))
                .tag(1)
            Text("🐼")
                .font(.system(size: 200))
                .tag(2)
        }
    }
}

struct TabTextView: View {
    
    // MARK: - Properties
    
    @Binding
    var currentSelection: Int
    
    let title: String
    let tag: Int
    
    private var isSelected: Bool {
        tag == currentSelection
    }
    
    // MARK: - Drawing
    
    var body: some View {
        
        Button(action: {  currentSelection = tag  }) {
            Text(title)
                .foregroundColor(
                    isSelected ? BrandColor.backgroundSecondary.color : Color(.systemGray)
                )
                .font(
                    isSelected ? BrandFontStyle.bold(20).font : BrandFontStyle.regular(20).font
                )
            
        }
    }
}
