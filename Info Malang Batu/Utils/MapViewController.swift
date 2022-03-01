//
//  MapViewController.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 11/02/22.
//

import Foundation
import GoogleMaps
import UIKit

class MapViewController: UIViewController {
    
    let map =  GMSMapView(frame: .zero)
    let defaultCamera = GMSCameraPosition.init(latitude: -7.982914, longitude: 112.630875, zoom: 9)
    var isAnimating: Bool = false
    
    override func loadView() {
        super.loadView()
        map.camera = defaultCamera
        self.view = map
    }
    
    // https://stackoverflow.com/a/65926143/3559183
    // google keyword uiviewcontrollerrepresentable call function
    func action(_ action: VCMapLinkAction) {
        print("MapViewController # \(#function) \(action)")
        map.camera = defaultCamera
    }
    
}
