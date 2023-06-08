//
//  HomeScreen.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @State var selectedWorkHistory: WorkHistory? = nil
    
    var body: some View {
        NavigationSplitView {
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
                    
                    List(person.workHistory, id: \.id, selection: $selectedWorkHistory) { workHistory in
                        NavigationLink(value: workHistory) {
                            WorkHistorySummaryView(workHistory: workHistory)
                                .padding(.top)
                        }
                        
                    }
                    .listStyle(.inset)
                } else {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
        } detail: {
            if let selectedWorkHistory = selectedWorkHistory {
                WorkHistoryDetailScreen(workHistory: selectedWorkHistory)
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
