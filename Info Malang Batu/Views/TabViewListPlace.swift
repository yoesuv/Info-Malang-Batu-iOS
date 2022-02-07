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
            
        }
        .onAppear {
            viewModel.fetchPlaces()
        }
    }
}

struct TabViewListPlace_Previews: PreviewProvider {
    static var previews: some View {
        TabViewListPlace()
    }
}
