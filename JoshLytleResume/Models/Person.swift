//
//  Person.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import Foundation

class Person: Decodable {
    let firstName: String
    let lastName: String
    let workHistory: [WorkHistory]
}
