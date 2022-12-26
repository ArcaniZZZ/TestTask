//
//  LocationView.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        HStack(spacing: 12) {
            Images.locationPin()?.image
            Text("Zihuatanejo, Gro")
                .foregroundColor(.black)
            Images.dropDownArrow()?.image
        }
    }
}
