//
//  ShopTabView.swift
//  Effective_TestTask
//
//  Created by Arcani on 24.12.2022.
//

import SwiftUI

struct ShopTabView: View {
    
    let cpu: String
    let camera: String
    let ssd: String
    let sd: String
    
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            InfoView(
                image: Images.cpu()?.image,
                subtitle: cpu
            )
            Spacer()
            InfoView(
                image: Images.photoCamera()?.image,
                subtitle: camera
            )
            Spacer()
            InfoView(
                image: Images.ssd()?.image,
                subtitle: ssd
            )
            Spacer()
            InfoView(
                image: Images.sd()?.image,
                subtitle: sd
            )
        }
    }
}

struct ShopTabView_Previews: PreviewProvider {
    static var previews: some View {
        ShopTabView(
            cpu: "Exynos 990",
            camera: "108 + 12 mp",
            ssd: "8 GB",
            sd: "18.86 x 22")
    }
}

struct InfoView: View {
    
    let image: Image?
    let subtitle: String
    
    var body: some View {
        VStack {
            image
            Text(subtitle)
                .font(BrandFontStyle.regular(14).font)
                .foregroundColor(.gray)
        }.frame(alignment: .centerFirstTextBaseline)
    }
}
