//
//  CategoryRows.swift
//  Landmarks
//
//  Created by Shawn Williams on 12/23/20.
//

import SwiftUI

struct CategoryRows: View {
    
    var categoryName: String
    var items: [Landmark]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0.0) {
                    ForEach(items) { landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRows_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        CategoryRows(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(5))
        )
    }
}
