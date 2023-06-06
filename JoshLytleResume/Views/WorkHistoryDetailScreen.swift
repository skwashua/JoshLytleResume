//
//  WorkHistoryDetailScreen.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import SwiftUI

struct WorkHistoryDetailScreen: View {
    var workHistory: WorkHistory
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if let url = workHistory.appIcon {
                    AsyncImage(url: url)
                }
                
                Rectangle()
                    .aspectRatio(1.0, contentMode: .fill)
                    .foregroundColor(.black)
                    .opacity(0.1)
                VStack {
                    Text(workHistory.name)
                        .font(.largeTitle)
                    DateRangeView(startDate: workHistory.startDate, endDate: workHistory.endDate)
                }
            }
            
            Text(workHistory.jobDescription)
                .font(.body)
            
            if let portfolioImages = workHistory.portfolioImages, !portfolioImages.count.words.isEmpty {
                ScrollView {
                    HStack(spacing: 0) {
                        portfolioImages.forEach { url in
                            AsyncImage(url: url)
                        }
                    }
                }
            }
            
        }
    }
}

struct WorkHistoryDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkHistoryDetailScreen(workHistory: WorkHistory.mockData())
    }
}
