//
//  HomeView.swift
//  RiveAnimation
//
//  Created by ebi igweze on 18/05/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                homeViewContent
            }
        }
            
    }
    
    
    var homeViewContent: some View {
        VStack {
            Text("Courses")
                .customFont(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(courses) { course in
                        CourseView(course: course)
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
            
            
            Text("Recent")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            
            VStack(spacing: 20) {
                ForEach(courseSections) { section in
                    CourseSectionView(courseSection: section)
                }
            }
            .padding(20)

        }
    }
}

#Preview {
    HomeView()
}
