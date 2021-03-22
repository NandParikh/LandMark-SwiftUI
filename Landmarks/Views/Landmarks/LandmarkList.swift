//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Nand Parikh on 22/02/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavouritesOnly = false
    
    var fileteredLandmarks:[Landmark]{
        modelData.landmarks.filter{
            landmark in (!showFavouritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List{
                Toggle(isOn: $showFavouritesOnly){
                    Text("Favorites only")
                }
                ForEach(fileteredLandmarks){ landmark in
                    
                    NavigationLink(destination:LandmarkDetail(landmark: landmark)){
                        
                        LandmarkRow(landmark: landmark)
                    
                    }
                }
            }

        }
        .navigationTitle("Landmarks")
    }
    
    // simple list with 1 by 1 row
    //List {
        //LandmarkRow (landmark: landmarks[0])
        //LandmarkRow (landmark: landmarks[1])
    //}
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        
//        For showing multiple device preview at a time use fore each loop
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//                    LandmarkList()
//                        .previewDevice(PreviewDevice(rawValue: deviceName))
//                        .previewDisplayName(deviceName)
//
//                }

    }
}
