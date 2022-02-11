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
    
    func makeUIViewController(context: Context) -> some MapViewController {
        return MapViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        let camera = GMSCameraPosition.init(latitude: -7.982914, longitude: 112.630875, zoom: 9)
        uiViewController.map.camera = camera
        let marker : GMSMarker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -7.982914, longitude: 112.630875)
        marker.title = "DOT Indonesia"
        marker.snippet = "Indonesia"
        marker.map = uiViewController.map
    }
}
