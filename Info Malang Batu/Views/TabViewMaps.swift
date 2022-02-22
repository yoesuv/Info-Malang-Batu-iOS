//
//  TabViewMaps.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI
import GoogleMaps
import AlertToast

struct TabViewMaps: View {
    
    @ObservedObject var viewModel = MapsViewModel()
    @State private var showToast = false
    
    var body: some View {
        NavigationView {
            MapViewControllerBridge(pins: viewModel.pins)
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("Maps")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                showToast.toggle()
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .foregroundColor(.white)
            }))
        }
        .onAppear {
            viewModel.fetchPins()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .toast(isPresenting: $showToast, alert: {
            AlertToast(type: .error(.yellow), title: "Under Development!")
        })
    }
}

struct TabViewMaps_Previews: PreviewProvider {
    static var previews: some View {
        TabViewMaps()
    }
}
