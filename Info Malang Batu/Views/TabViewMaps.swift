//
//  TabViewMaps.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI
import GoogleMaps

struct TabViewMaps: View {
    var body: some View {
        NavigationView {
            AppGoogleMapsView()
                .edgesIgnoringSafeArea(.top)
            .navigationTitle("Maps")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct AppGoogleMapsView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some GMSMapView {
        let path = Bundle.main.path(forResource: "keys", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path ?? "")
        let apiKey = dict!["google_maps_api_key"] as? String
        GMSServices.provideAPIKey(apiKey!)
        let camera = GMSCameraPosition.init(latitude: -7.927592, longitude: 112.600567, zoom: 16)
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
