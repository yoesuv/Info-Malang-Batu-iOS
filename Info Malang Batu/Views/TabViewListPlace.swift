//
//  TabViewListPlace.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI
@preconcurrency import AlertToast

struct TabViewListPlace: View {
    
    @StateObject private var viewModel = ListPlaceViewModel(NetworkService())
    @State private var showMenuListPlace = false
    @State private var selectedFilter = FilterItemListPlaceModel(title: "Semua", location: Location.semua)
    
    var body: some View {
        NavigationStack {
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showMenuListPlace.toggle()
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .sheet(isPresented: $showMenuListPlace) {
            VStack(spacing: 18) {
                ForEach(viewModel.filters) { filter in
                    ItemCheckListPlace(
                        filter: filter,
                        selectedFilter: $selectedFilter,
                        showMenuListPlace: $showMenuListPlace,
                        completion: { location in
                            loadPlace(location)
                        }
                    )
                }
            }
            .padding(.top, 35)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity)
            .presentationDetents([.height(300)])
            .presentationCornerRadius(24)
            .presentationDragIndicator(.visible)
            .presentationBackground {
                ZStack {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .opacity(0.85)
                    
                    // Liquid Glass top edge highlight
                    VStack {
                        Rectangle()
                            .fill(.white.opacity(0.12))
                            .frame(height: 1)
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchPlaces(self.selectedFilter.location)
        }
        .toast(isPresenting: $viewModel.loading, alert: {
            AlertToast.init(type: .loading)
        })
    }

    func loadPlace(_ location: Location) {
        print("TabViewListPlace # \( #function) : \(location)")
        viewModel.fetchPlaces(location)
    }

}

struct TabViewListPlace_Previews: PreviewProvider {
    static var previews: some View {
        TabViewListPlace()
    }
}
