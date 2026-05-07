//
//  TabViewMaps.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI
@preconcurrency import GoogleMaps
@preconcurrency import AlertToast

struct TabViewMaps: View {
    
    @StateObject private var viewModel = MapsViewModel()
    @StateObject private var vcMapLink = VCMapLink()
    
    var body: some View {
        let mapView = MapViewControllerBridge(pins: viewModel.pins, vcMapLink: vcMapLink)
        NavigationStack {
            mapView
            .ignoresSafeArea(.container, edges: .top)
            .navigationTitle("Maps")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        vcMapLink.resetMap()
                    }) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchPins()
        }
        .toast(isPresenting: $viewModel.loading, alert: {
            AlertToast.init(type: .loading)
        })
    }
}

struct TabViewMaps_Previews: PreviewProvider {
    static var previews: some View {
        TabViewMaps()
    }
}
