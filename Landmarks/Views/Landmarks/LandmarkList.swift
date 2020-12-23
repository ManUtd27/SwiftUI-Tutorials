//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Shawn Williams on 12/23/20.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State var isAddModalSheetShown: Bool = false
    @State var isSearchAlertShown: Bool = false
    //    @State private var searchText = ""
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    //                    SearchBar(text: $searchText)
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites Only")
                    }
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            .navigationBarItems(leading: Button(action: { self.isSearchAlertShown = true}){Image(systemName: "magnifyingglass").font(.largeTitle)
            }, trailing: Button(action: { self.isAddModalSheetShown = true}){Image(systemName: "plus").font(.largeTitle)
            } )
            .sheet(isPresented: $isAddModalSheetShown, content: {
                VStack {
                    LandmarkNew()
                }
            })
            .alert(isPresented: $isSearchAlertShown) {
                Alert(title: Text("Important message"), message: Text("Needs Search Text Field"), dismissButton: .default(Text("Got it!")))
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
