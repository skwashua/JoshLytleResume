//
//  Date+Extension.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/22/23.
//

import Foundation

extension Date {
    func monthYearString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MM/YYYY"
        
        return dateFormatter.string(from: self)
    }
}
