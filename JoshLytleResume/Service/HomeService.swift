//
//  HomeService.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import Foundation
import Combine

struct HomeService: WebService {
    var cancellables: Set<AnyCancellable> = []
    
    enum Endpoint: String {
        case home = "/JoshLytleResume/master/home.json"
    }
    
    func fetchHome() -> AnyPublisher<Person, Error> {
        return BaseService().get(endpoint: Endpoint.home.rawValue)
            .decode(type: Person.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
