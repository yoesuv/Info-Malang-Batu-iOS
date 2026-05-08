//
//  TabViewGallery.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI
@preconcurrency import AlertToast

struct TabViewGallery: View {
    
    @StateObject private var viewModel = GalleryViewModel(NetworkService())
    let column = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false){
                LazyVGrid(columns: column, spacing: 0) {
                    ForEach(viewModel.galleries) { item in
                        NavigationLink(destination: GalleryDetailView(gallery: item)) {
                            GeometryReader { geo in
                                ItemGalleryView(gallery: item)
                            }
                            .clipped()
                            .aspectRatio(1, contentMode: .fill)
                        }
                    }
                }
            }
            .navigationTitle("Gallery")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.fetchGalleries()
        }
        .toast(isPresenting: $viewModel.loading, alert: {
            AlertToast.init(type: .loading)
        })
    }
}

struct TabViewGallery_Previews: PreviewProvider {
    static var previews: some View {
        TabViewGallery()
    }
}
