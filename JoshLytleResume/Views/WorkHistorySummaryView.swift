//
//  WorkHistorySummaryView.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/22/23.
//

import SwiftUI

struct WorkHistorySummaryView: View {
    var workHistory: WorkHistory
    
    var body: some View {
        HStack(alignment: .top) {
            if let url = workHistory.appIcon {
                AsyncImage(url: url)
                    .cornerRadius(9)
                    .frame(width: 57, height: 57)
            }
            
            VStack(alignment: .leading) {
                Text(workHistory.name)
                    .bold()
                
                DateRangeView(startDate: workHistory.startDate, endDate: workHistory.endDate)
            }
                        
            Text(workHistory.jobDescription)
                .lineLimit(0)
            Spacer()
        }
        .padding(.horizontal)

    }
}

//struct WorkHistorySummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkHistorySummaryView()
//    }
//}
