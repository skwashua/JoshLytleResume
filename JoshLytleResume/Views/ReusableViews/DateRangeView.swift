//
//  DateRangeView.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 6/5/23.
//

import SwiftUI

struct DateRangeView: View {
    var startDate: Date
    var endDate: Date?
    
    var body: some View {
        Text("\(startDate.monthYearString()) - \(endDate?.monthYearString() ?? "Current")")
    }
}

struct DateRangeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DateRangeView(startDate: Date())
            DateRangeView(startDate: Date(), endDate: Date.distantFuture)
        }
    }
}
