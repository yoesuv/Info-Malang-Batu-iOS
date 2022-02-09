//
//  ChangelogModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import Foundation

struct ChangelogModel: Identifiable {
    var id: String {
        return version
    }
    let version: String
    let information: String
}
