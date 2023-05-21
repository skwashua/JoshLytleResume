//
//  WorkHistory.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import Foundation

struct WorkHistory: Decodable {
    struct Skill: Decodable {
        var title: String
    }
    
    let name: String
    private let startDateValue: TimeInterval  
    private let endDateValue: TimeInterval?
    var skills: [Skill]?
    var jobDescription: String

    var startDate: Date {
        return Date(timeIntervalSince1970: startDateValue)
    }
    var endtDate: Date? {
        guard let endDateValue = endDateValue else { return nil }
        return Date(timeIntervalSince1970: endDateValue)
    }
    
    enum CodingKeys: String, CodingKey {
        case startDateValue = "startDate"
        case endDateValue = "endDate"
        case name, skills, jobDescription
    }
}
