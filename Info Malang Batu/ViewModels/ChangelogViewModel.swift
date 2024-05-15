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
        changelog.append(ChangelogModel(version: "1.2.2", information: "- update libraries"))
        changelog.append(ChangelogModel(version: "1.2.1", information: "- update libraries"))
        changelog.append(ChangelogModel(version: "1.2.0", information: "- add filter list place</br>- change base color brown"))
        changelog.append(ChangelogModel(version: "1.1.0", information: "- add maps"))
        changelog.append(ChangelogModel(version: "1.0.0", information: "- initial release"))
    }
    
}
