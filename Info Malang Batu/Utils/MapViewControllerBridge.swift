//
//  MapViewControllerBridge.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 11/02/22.
//

import Foundation
import SwiftUI
@preconcurrency import GoogleMaps
import Combine

struct MapViewControllerBridge: UIViewControllerRepresentable {
    
    var pins: [PinModel]
    var vcMapLink: VCMapLink
    @StateObject var locationManager = LocationManager()
    
    @MainActor
    class Coordinator {
        var vcMapLink: VCMapLink? {
            didSet {
                cancelable = vcMapLink?.$action.sink(receiveValue: { [weak self] (action) in
                    guard let self, let action = action else {
                        return
                    }
                    self.mapController?.action(action)
                })
            }
        }
        weak var mapController: MapViewController?
        private var cancelable: AnyCancellable?
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIViewController(context: Context) -> some MapViewController {
        return MapViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        context.coordinator.mapController = uiViewController
        context.coordinator.vcMapLink = vcMapLink
        uiViewController.map.clear()
        
        if CLLocationManager.locationServicesEnabled() {
            let userLat = locationManager.lastLocation?.coordinate.latitude ?? 0.0
            let userLng = locationManager.lastLocation?.coordinate.longitude ?? 0.0
            print("MapViewControllerBridge # test get user user location lat:\(userLat) lng:\(userLng)")
            uiViewController.map.isMyLocationEnabled = true
            uiViewController.map.settings.compassButton = true
            uiViewController.map.settings.myLocationButton = true
        }
        
        for pin in pins {
            let marker = GMSMarker()
            let locationLatLng = CLLocationCoordinate2D(latitude: pin.latitude ?? 0, longitude: pin.longitude ?? 0)
            if let markerImage = UIImage(named: "IcMapPin")?.withRenderingMode(.alwaysTemplate) {
                marker.icon = markerImage
            }
            marker.position = locationLatLng
            marker.title = pin.name
            marker.map = uiViewController.map
        }
    }
}
