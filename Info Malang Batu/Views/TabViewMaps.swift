//
//  TabViewMaps.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI
import GoogleMaps

struct TabViewMaps: View {
    
    @ObservedObject var viewModel = MapsViewModel()
    
    var body: some View {
        NavigationView {
            AppGoogleMapsView()
                .edgesIgnoringSafeArea(.top)
            .navigationTitle("Maps")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.fetchPins()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct AppGoogleMapsView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some GMSMapView {
        let camera = GMSCameraPosition.init(latitude: -7.982914, longitude: 112.630875, zoom: 9)
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

struct TabViewMaps_Previews: PreviewProvider {
    static var previews: some View {
        TabViewMaps()
    }
}
