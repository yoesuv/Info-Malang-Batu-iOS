//
//  GalleryDetailView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI
import Kingfisher

struct GalleryDetailView: View {
    
    let gallery: GalleryModel?
    let imageHeight: CGFloat = 230
    let paddingText = EdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .leading) {
               KFImage.url(URL(string: gallery?.image ?? ""))
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
        .navigationBarTitle(Text("Detail Gallery"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentation.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
        }.foregroundColor(.white))
    }
}

struct GalleryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryDetailView(gallery: nil)
    }
}
