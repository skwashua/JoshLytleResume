//
//  HomeService.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import Foundation
import Combine

struct HomeService: WebService {    
    enum Endpoint: String {
        case home = "/skwashua/JoshLytleResume/main/data/home.json"
    }
    
    func fetchHome() -> AnyPublisher<Person, Error> {
        return BaseService().get(endpoint: Endpoint.home.rawValue)
            .decode(type: Person.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
