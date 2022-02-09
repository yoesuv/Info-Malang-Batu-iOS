//
//  TabViewGallery.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct TabViewGallery: View {
    
    @ObservedObject var viewModel = GalleryViewModel()
    let column = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]
    
    var body: some View {
        NavigationView {
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
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct TabViewGallery_Previews: PreviewProvider {
    static var previews: some View {
        TabViewGallery()
    }
}
