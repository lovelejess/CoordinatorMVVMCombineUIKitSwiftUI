//
//  OnboardingView.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import SwiftUI

struct OnboardingView: View {
    
    var doneRequested: () -> ()

    var body: some View {
        TabView {
            ScaledImageView(name: "strawberry")
            ScaledImageView(name: "dog")
                .tag(1)
            ScaledImageView(name: "typewriter")
                .tag(2)
            Button("Done") {
                doneRequested()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.gray.ignoresSafeArea(.all))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(doneRequested: {})
    }
}
