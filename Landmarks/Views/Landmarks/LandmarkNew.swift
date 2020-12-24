//
//  LandmarkNew.swift
//  Landmarks
//
//  Created by Shawn Williams on 12/23/20.
//

import SwiftUI
import CoreLocation


struct LandmarkNew: View {
    
    @State var name: String = ""
    @State var park: String = ""
    @State var state: String = ""
    @State var description: String = ""
    @State var latitude: String = ""
    @State var longitude: String = ""
    @State var isShowingMapModal = false
    
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("General Information")){
                    HStack {
                        Text("Name").bold()
                        Divider()
                        TextField("Landmark Name", text: $name)
                    }
                    HStack {
                        Text("Park").bold()
                        Divider()
                        TextField("Park", text: $park)
                    }
                    HStack {
                        Text("State").bold()
                        Divider()
                        TextField("State", text: $state)
                    }
                    HStack {
                        Text("Description").bold()
                        Divider()
                        TextField("Description", text: $description)
                    }
                }
                
                Section(header: Text("Location")){
                    HStack {
                        Image("maps-icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                            .frame(width: 52.0, height: 52.0)
                            .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                self.isShowingMapModal.toggle()
                            })
                            .sheet(isPresented: $isShowingMapModal, content: {
                                VStack {
                                    Text("Map View")
                                }
                            })
                        
                        Divider()
                        VStack {
                            HStack {
                                Text("Latitude").bold()
                                Divider()
                                TextField("Latitude", text: $latitude)
                            }
                            HStack {
                                Text("Longitude").bold()
                                Divider()
                                TextField("Longitude", text: $longitude)
                            }
                        }
                    }
                }
                
                Section{
                    Button(action: {
                        print("Submited")
                    }, label: {
                        Text("Submit")
                    })
                }
            }
            .navigationTitle("New Landmark")
        }
    }
}

struct LandmarkNew_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkNew()
    }
}
