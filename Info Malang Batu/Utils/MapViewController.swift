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
    var isAnimating: Bool = false
    
    override func loadView() {
        super.loadView()
        self.view = map
    }
    
}
