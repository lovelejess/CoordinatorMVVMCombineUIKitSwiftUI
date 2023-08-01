//
//  ScaledImageView.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import SwiftUI

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .tag(0)
    }
}
