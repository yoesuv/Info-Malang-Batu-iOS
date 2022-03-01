//
//  TabViewMaps.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI
import GoogleMaps
import AlertToast

struct TabViewMaps: View {
    
    @ObservedObject var viewModel = MapsViewModel()
    @ObservedObject var vcMapLink = VCMapLink()
    
    var body: some View {
        let mapView = MapViewControllerBridge(pins: viewModel.pins, vcMapLink: vcMapLink)
        NavigationView {
            mapView
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("Maps")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                vcMapLink.resetMap()
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .foregroundColor(.white)
            }))
        }
        .onAppear {
            viewModel.fetchPins()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
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
