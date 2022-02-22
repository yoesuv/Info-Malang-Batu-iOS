//
//  PinModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 10/02/22.
//

import Foundation

struct PinModel: Codable, Identifiable {
    var id: String {
        return name!
    }
    let name: String?
    let lokasi: Int?
    let latitude: Double?
    let longitude: Double?
}
