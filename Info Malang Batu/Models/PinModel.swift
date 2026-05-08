//
//  PinModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 10/02/22.
//

import Foundation

struct PinModel: Codable, Identifiable, Sendable {
    var id: String {
        return name ?? UUID().uuidString
    }
    let name: String?
    let lokasi: Int?
    let latitude: Double?
    let longitude: Double?
}
