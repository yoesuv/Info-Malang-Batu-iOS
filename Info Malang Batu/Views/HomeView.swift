//
//  HomeView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedTab = 0
    private let brown = UIColor(named: "Brown500")!
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = brown
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "pacifico", size: 20)!]
        appearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().isTranslucent = false
    }
    
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
                TabViewMaps().tabItem {
                    Image(systemName: "map")
                    Text("Maps")
                }
                .tag(2)
                TabViewAbout().tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("About")
                }
                .tag(3)
            }
            .accentColor(Color(brown))
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
