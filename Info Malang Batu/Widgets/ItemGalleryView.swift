//
//  ItemGalleryView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 08/02/22.
//

import SwiftUI
import Kingfisher

struct ItemGalleryView: View {
    
    let gallery: GalleryModel?
    
    var body: some View {
        KFImage.url(URL(string: gallery?.image ?? ""))
            .placeholder {
                Image(uiImage: UIImage(named: "PlaceholderLoadingSquare")!)
                    .resizable()
                    .scaledToFill()
                    .clipped()
            }
            .onFailureImage(UIImage(named: "PlaceholderErrorSquare"))
            .cancelOnDisappear(true)
            .fade(duration: 0.25)
            .resizable()
            .scaledToFill()
            .clipped()
    }
}

struct ItemGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ItemGalleryView(gallery: nil)
    }
}
