//
//  MapViewControllerBridge.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 11/02/22.
//

import Foundation
import SwiftUI
import GoogleMaps

struct MapViewControllerBridge: UIViewControllerRepresentable {
    
    var pins:[PinModel]
    
    func makeUIViewController(context: Context) -> some MapViewController {
        return MapViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        let camera = GMSCameraPosition.init(latitude: -7.982914, longitude: 112.630875, zoom: 9)
        uiViewController.map.camera = camera
        uiViewController.map.settings.compassButton = true
        uiViewController.map.clear()
        for pin in pins {
            let markerImage = UIImage(named: "IcMapPin")!.withRenderingMode(.alwaysTemplate)
            let marker = GMSMarker()
            let locationLatLng = CLLocationCoordinate2D(latitude: pin.latitude ?? 0, longitude: pin.longitude ?? 0)
            marker.icon = markerImage
            marker.position = locationLatLng
            marker.title = pin.name
            marker.map = uiViewController.map
        }
    }
}
