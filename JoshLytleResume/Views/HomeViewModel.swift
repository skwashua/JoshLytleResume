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
    var cancellables: Set<AnyCancellable> = []
    
    func load() {
        HomeService().fetchHome()
            .sink { completion in
                print("Fetch home complete \(completion)")
            } receiveValue: { [unowned self] result in
                self.person = result
            }
            .store(in: &cancellables)
    }
}
