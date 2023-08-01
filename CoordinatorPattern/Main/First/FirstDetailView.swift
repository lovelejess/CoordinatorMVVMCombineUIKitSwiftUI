//
//  FirstDetailView.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import SwiftUI

struct FirstDetailView: View {
    
    @ObservedObject var viewModel: FirstTabViewModel

    var body: some View {
        VStack {
            Text("Login")
            TextField("name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Submit", action: submitLoginRequested)
        }
    }

    private func submitLoginRequested() {
        viewModel.didSubmitLogin = true
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView(viewModel: FirstTabViewModel())
    }
}
