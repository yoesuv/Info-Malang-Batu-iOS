//
//  GalleryModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation

struct GalleryModel: Codable, Identifiable {
    var id: String {
        return caption!
    }
    let caption: String?
    let thumbnail: String?
    let image: String?
}
