//
//  FirstTabViewModel.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Foundation

class FirstTabViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var email: String = ""
}
