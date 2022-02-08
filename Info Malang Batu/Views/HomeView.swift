//
//  HomeView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        NavigationView {
            TabView (selection: $selectedTab){
                TabViewListPlace().tabItem {
                    Image(systemName: "house.fill")
                    Text("List Place")
                }
                .tag(0)
                TabViewGallery().tabItem {
                    Image(systemName: "photo.artframe")
                    Text("Gallery")
                }
                .tag(1)
                TabViewAbout().tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("About")
                }
                .tag(2)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
