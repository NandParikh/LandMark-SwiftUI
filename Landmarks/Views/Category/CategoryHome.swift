//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Nand Parikh on 22/02/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{

            List{
                
//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height:200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())
                
                
                PageView(pages: modelData.features.map {
                    FeatureCard(landmark: $0)
                })
                .aspectRatio(3/2, contentMode: .fit)
                .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
            .navigationBarItems(trailing: ProfileButton(destination: UserForm()) )
        }
    }
}


struct ProfileButton<Destination : View>: View {

    var destination:  Destination

    var body: some View {
        HStack{
            NavigationLink(destination: self.destination) {
                Image(systemName: "person.crop.circle").imageScale(.large)
            }
        }
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}

