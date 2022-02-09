//
//  PlaceModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation

struct PlaceModel: Codable, Identifiable {
    var id: String {
        return nama!
    }
    let nama: String?
    let lokasi: String?
    let deskripsi: String?
    let thumbnail: String?
    let gambar: String?
}
