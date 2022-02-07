//
//  TabViewGallery.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct TabViewGallery: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Gallery")
            }
            .navigationTitle("Gallery")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarHidden(true)
    }
}

struct TabViewGallery_Previews: PreviewProvider {
    static var previews: some View {
        TabViewGallery()
    }
}
