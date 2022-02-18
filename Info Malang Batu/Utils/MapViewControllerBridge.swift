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
    @StateObject var locationManager = LocationManager()
    let mapViewController = MapViewController()
    
    func makeUIViewController(context: Context) -> some MapViewController {
        return mapViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.map.clear()
        if (CLLocationManager.locationServicesEnabled()) {
            let userLat = locationManager.lastLocation?.coordinate.latitude ?? 0.0
            let userLng = locationManager.lastLocation?.coordinate.longitude ?? 0.0
            print("MapViewControllerBridge # test get user user location lat:\(userLat) lng:\(userLng)")
            uiViewController.map.isMyLocationEnabled = true
            uiViewController.map.settings.compassButton = true
            uiViewController.map.settings.myLocationButton = true
        }
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
