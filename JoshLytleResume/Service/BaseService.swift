//
//  BaseService.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import Foundation
import Combine

protocol WebService {
    associatedtype Endpoint: RawRepresentable where Endpoint.RawValue == String
}

struct BaseService {
    enum ServiceError: Error {
        case invalidURL
        case invalidResponse
        case statusCode(Int)
    }
    
    var session: URLSession = URLSession.shared
    
    func get(endpoint: String, queryParams: [String: String]? = nil) -> AnyPublisher<Data, Error> {
        let rawUrl = Environment.shared.defaultWebProtocol + Environment.shared.defaultDomain + endpoint
        guard let url = URL(string: rawUrl) else {
            return Fail(error: ServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url)
        return session.dataTaskPublisher(for: request)
            .retry(2)
            .mapError({ error -> URLError in
                return error
            })
            .tryMap { try self.validate($0.data, $0.response) }
            .eraseToAnyPublisher()
    }
    
    private func validate(_ data: Data, _ response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ServiceError.invalidResponse
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw ServiceError.statusCode(httpResponse.statusCode)
        }
        
        return data
    }
}

