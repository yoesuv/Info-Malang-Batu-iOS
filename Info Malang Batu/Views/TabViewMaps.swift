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
        .onAppear {
            loadApiKeys()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    func loadApiKeys() {
        if let path = Bundle.main.path(forResource: "keys", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) {
                if let apiKey = dict["google_maps_api_key"] as? String {
                    print("TabViewMaps # google maps api key \(apiKey)")
                }
            }
        }
    }
    
}

struct TabViewMaps_Previews: PreviewProvider {
    static var previews: some View {
        TabViewMaps()
    }
}
