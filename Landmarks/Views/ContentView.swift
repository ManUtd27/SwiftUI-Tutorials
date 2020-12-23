//
//  ContentView.swift
//  Landmarks
//
//  Created by Shawn Williams on 12/23/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                  .environmentObject(ModelData())
    }
}
