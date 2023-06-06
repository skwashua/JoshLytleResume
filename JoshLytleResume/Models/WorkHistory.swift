//
//  WorkHistory.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import Foundation

struct WorkHistory: Decodable, Identifiable {
    struct Skill: Decodable {
        var title: String
    }
    
    let id = UUID()
    let name: String
    private let startDateValue: TimeInterval
    private let endDateValue: TimeInterval?
    var skills: [Skill]?
    var jobDescription: String
    private let appIconValue: String?
    private let portfolioImageValues: [String]?
    
    var startDate: Date {
        return Date(timeIntervalSince1970: startDateValue)
    }
    var endDate: Date? {
        guard let endDateValue = endDateValue else { return nil }
        return Date(timeIntervalSince1970: endDateValue)
    }
    var appIcon: URL? {
        guard let urlString = appIconValue else { return nil }
        return URL(string: urlString)
    }
    
    var portfolioImages: [URL]? {
        guard let urlStrings = portfolioImageValues else { return nil }
        return urlStrings.compactMap({ URL(string: $0) })
    }

    enum CodingKeys: String, CodingKey {
        case startDateValue = "startDate"
        case endDateValue = "endDate"
        case appIconValue = "appIcon"
        case portfolioImageValues = "portfolioImages"
        case name, skills, jobDescription
    }
    
    init(name: String, startDateValue: TimeInterval, endDateValue: TimeInterval?, skills: [Skill]? = nil, jobDescription: String, appIconValue: String?) {
        self.name = name
        self.startDateValue = startDateValue
        self.endDateValue = endDateValue
        self.skills = skills
        self.jobDescription = jobDescription
        self.appIconValue = appIconValue
        self.portfolioImageValues = nil
    }
}

extension WorkHistory {
    static func mockData() -> WorkHistory {
        return WorkHistory(name: "SomeCompany", startDateValue: Date().timeIntervalSinceNow, endDateValue: nil, jobDescription: "Here is my cool description", appIconValue: nil)
    }
}
