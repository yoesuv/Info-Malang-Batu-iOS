//
//  ChangelogViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import Foundation

class ChangelogViewModel: ObservableObject {
    
    @Published var changelog = [ChangelogModel]()
    
    init() {
        changelog.append(ChangelogModel(version: "1.0.0", information: "- initial release"))
    }
    
}
