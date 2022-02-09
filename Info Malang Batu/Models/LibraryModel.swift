//
//  LibraryModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import Foundation

struct LibraryModel: Identifiable {
    var id: String {
        return name
    }
    let name: String
    let url: String
    let license: String
}
