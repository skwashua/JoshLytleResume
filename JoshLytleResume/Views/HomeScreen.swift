//
//  HomeScreen.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            if let person = viewModel.person {
                HStack() {
                    Text(person.firstName)
                    Text(person.lastName)
                }
                .font(.largeTitle)
                
                if let title = person.title {
                    Text(title)
                }
                
                Divider()
                
                ForEach(person.workHistory) { workHistory in
                    WorkHistorySummaryView(workHistory: workHistory)
                        .padding(.top)
                }
                
                Spacer()
                
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .task {
            viewModel.load()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
