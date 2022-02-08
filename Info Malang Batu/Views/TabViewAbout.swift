//
//  TabViewAbout.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct TabViewAbout: View {
    
    @State var selectedTab:Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selectedTab) {
                    SwipeTabAbout().tag(0)
                    SwipeTabChangelog().tag(1)
                    SwipeTabLibraries().tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct TabViewAbout_Previews: PreviewProvider {
    static var previews: some View {
        TabViewAbout()
    }
}
