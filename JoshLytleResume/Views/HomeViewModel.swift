//
//  HomeViewModel.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var person: Person?
    
    func load() {
        
    }
}
