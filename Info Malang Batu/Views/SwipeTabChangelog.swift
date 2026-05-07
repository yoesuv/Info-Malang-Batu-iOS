//
//  SwipeTabChangelog.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 08/02/22.
//

import SwiftUI

struct SwipeTabChangelog: View {
    
    @StateObject private var viewModel = ChangelogViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(viewModel.changelog) { item in
                    ItemChangelogView(changelog: item)
                }
            }
        }
    }
}

struct SwipeTabChangelog_Previews: PreviewProvider {
    static var previews: some View {
        SwipeTabChangelog()
    }
}
