//
//  VCMapLink.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 25/02/22.
//

import Foundation
import SwiftUI

enum VCMapLinkAction: Sendable {
    case resetMap
}

@MainActor
class VCMapLink: ObservableObject {
    @Published var action: VCMapLinkAction?
    
    func resetMap() {
        action = .resetMap
    }
}
