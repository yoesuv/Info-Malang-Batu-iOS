//
//  TabViewAbout.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct TabViewAbout: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("About")
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarHidden(true)
    }
}

struct TabViewAbout_Previews: PreviewProvider {
    static var previews: some View {
        TabViewAbout()
    }
}
