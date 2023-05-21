//
//  Environment.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import Foundation

class Environment {
    static let shared = Environment()
    var defaultWebProtocol = "https://"
    var defaultDomain = "raw.githubusercontent.com"
    
    internal required init() { }
}
