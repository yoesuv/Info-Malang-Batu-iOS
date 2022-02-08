//
//  Bundle.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 08/02/22.
//

import Foundation

// https://stackoverflow.com/a/29978300
extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
