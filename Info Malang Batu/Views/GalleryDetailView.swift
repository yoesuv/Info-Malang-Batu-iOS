//
//  GalleryDetailView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI
@preconcurrency import Kingfisher

struct GalleryDetailView: View {
    
    let gallery: GalleryModel?
    let imageHeight: CGFloat = 230
    let paddingText = EdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .leading) {
               KFImage.url(URL(string: gallery?.image ?? ""))
                    .onFailureView { Image("PlaceholderError").resizable() }
                   .cancelOnDisappear(true)
                   .fade(duration: 0.25)
                   .resizable()
                   .scaledToFill()
                   .frame(width: geo.size.width, height: imageHeight)
                   .clipped()
                Text(gallery?.caption ?? "")
                   .font(.callout)
                   .padding(paddingText)
            }
            .frame(maxHeight: geo.size.height, alignment: .topLeading)
        }
        .navigationTitle("Detail Gallery")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct GalleryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryDetailView(gallery: nil)
    }
}
