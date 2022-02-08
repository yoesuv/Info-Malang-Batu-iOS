//
//  TabViewListPlace.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct TabViewListPlace: View {
    
    @ObservedObject var viewModel = ListPlaceViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.places) { place in
                    ItemPlaceView(place: place)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(PlainListStyle())
            .navigationTitle("List Place")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.fetchPlaces()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct TabViewListPlace_Previews: PreviewProvider {
    static var previews: some View {
        TabViewListPlace()
    }
}
