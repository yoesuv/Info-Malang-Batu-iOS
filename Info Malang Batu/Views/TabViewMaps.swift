//
//  TabViewMaps.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI

struct TabViewMaps: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Menu Maps")
            }
            .navigationTitle("Maps")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct TabViewMaps_Previews: PreviewProvider {
    static var previews: some View {
        TabViewMaps()
    }
}
