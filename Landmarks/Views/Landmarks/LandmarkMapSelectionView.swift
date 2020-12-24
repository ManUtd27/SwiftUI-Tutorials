//
//  LandmarkMapSelectionView.swift
//  Landmarks
//
//  Created by Shawn Williams on 12/23/20.
//

import SwiftUI
import MapKit

struct LandmarkMapSelectionView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.746483, longitude: -92.289597) , span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $region)
                   .edgesIgnoringSafeArea(.all)
    }
}

struct LandmarkMapSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkMapSelectionView()
    }
}
