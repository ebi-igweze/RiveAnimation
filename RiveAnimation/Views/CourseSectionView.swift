//
//  CourseSectionsView.swift
//  RiveAnimation
//
//  Created by ebi igweze on 18/05/2024.
//

import SwiftUI

struct CourseSectionView: View {
    @State var courseSection: CourseSection
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(courseSection.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(courseSection.caption)
                    .customFont(.body)
            }
            
            Divider()
            
            courseSection.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(courseSection.color)
        .foregroundColor(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        
    }
}

#Preview {
    CourseSectionView(courseSection: courseSections[0])
}
