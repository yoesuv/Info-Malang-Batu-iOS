//
//  ListPlaceDetailView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI
import Kingfisher

struct ListPlaceDetailView: View {
    
    let place: PlaceModel?
    let imageHeight: CGFloat = 230
    let paddingText = EdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .leading) {
               KFImage.url(URL(string: place?.gambar ?? ""))
                   .cancelOnDisappear(true)
                   .fade(duration: 0.25)
                   .resizable()
                   .scaledToFill()
                   .frame(width: geo.size.width, height: imageHeight)
                   .clipped()
               Text("\(place?.nama ?? "")")
                   .font(.body)
                   .fontWeight(.semibold)
                   .padding(paddingText)
               Text("\(place?.deskripsi ?? "")")
                   .font(.callout)
                   .padding(paddingText)
            }
            .frame(maxHeight: geo.size.height, alignment: .topLeading)
        }
        .navigationBarTitle(Text("Detail Place"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentation.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
        }.foregroundColor(.white))
    }
}

struct ListPlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListPlaceDetailView(place: nil)
    }
}
