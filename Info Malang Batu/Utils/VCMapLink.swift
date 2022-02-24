//
//  VCMapLink.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 25/02/22.
//

import Foundation
import SwiftUI

enum VCMapLinkAction {
    case resetMap
}

class VCMapLink: ObservableObject {
    @Published var action: VCMapLinkAction?
    
    @objc func resetMap() {
        action = .resetMap
    }
}
