//
//  PlaceModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation

struct PlaceModel: Codable, Identifiable, Sendable {
    var id: String {
        return nama ?? UUID().uuidString
    }
    let nama: String?
    let lokasi: String?
    let deskripsi: String?
    let thumbnail: String?
    let gambar: String?
}
