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
    var title: String?
    let workHistory: [WorkHistory]
}
