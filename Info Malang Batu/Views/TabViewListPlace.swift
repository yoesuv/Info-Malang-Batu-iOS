//
//  TabViewListPlace.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI
import AlertToast

struct TabViewListPlace: View {
    
    @ObservedObject var viewModel = ListPlaceViewModel()
    @State private var showMenuListPlace = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.places) { place in
                        NavigationLink(destination: ListPlaceDetailView(place: place)) {
                            ItemPlaceView(place: place)
                        }
                    }
                }
            }
            .navigationTitle("List Place")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                showMenuListPlace.toggle()
            }, label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.white)
            }))
        }
        .onAppear {
            viewModel.fetchPlaces()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .confirmationDialog("", isPresented: $showMenuListPlace, actions: {
            Button("Semua") {
                viewModel.fetchPlaces()
            }
            Button("Kab Malang") {
                viewModel.fetchKabMalangPlaces()
            }
            Button("Kota Batu") {
                viewModel.fetchKotaBatuPlaces()
            }
            Button("Kota Malang") {
                viewModel.fetchKotaMalangPlaces()
            }
        })
        .toast(isPresenting: $viewModel.loading, alert: {
            AlertToast.init(type: .loading)
        })
    }

}

struct TabViewListPlace_Previews: PreviewProvider {
    static var previews: some View {
        TabViewListPlace()
    }
}
