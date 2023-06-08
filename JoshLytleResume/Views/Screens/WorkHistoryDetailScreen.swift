//
//  WorkHistoryDetailScreen.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 5/20/23.
//

import SwiftUI
import ImageViewerRemote

struct WorkHistoryDetailScreen: View {
    var workHistory: WorkHistory
    
    @State var showImageViewer: Bool = false
    @State var selectedImage: String = ""
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(spacing: 0) {
                    ZStack {
                        if let url = workHistory.appIcon {
                            AsyncImage(url: url) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.size.width, height: proxy.size.width)
                                    .blur(radius: 8.0)
                            } placeholder: {
                                ProgressView()
                            }
                            .clipped()
                        }
                        
                        Rectangle()
                            .frame(width: proxy.size.width, height: proxy.size.width)
                            .foregroundColor(.black)
                            .opacity(0.5)
                        
                        VStack {
                            Text(workHistory.name)
                                .font(.largeTitle)
                                .bold()
                            DateRangeView(startDate: workHistory.startDate, endDate: workHistory.endDate)
                        }
                        .foregroundColor(.white)
                    }
                    
                    Text(workHistory.jobDescription)
                        .font(.body)
                        .padding()
                    
                    if let images = workHistory.portfolioImages {
                        ScrollView(.horizontal) {
                            HStack(alignment: .top) {
                                ForEach(images) { url in
                                    Button {
                                        selectedImage = url.absoluteString
                                        showImageViewer = true
                                    } label: {
                                        AsyncImage(url: url) { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 400.0)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .overlay {
            ImageViewerRemote(imageURL: $selectedImage, viewerShown: $showImageViewer)
        }
    }
}

struct WorkHistoryDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkHistoryDetailScreen(workHistory: WorkHistory.mockData())
    }
}
