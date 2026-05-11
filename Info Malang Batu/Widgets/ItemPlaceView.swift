//
//  ItemPlaceView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import SwiftUI
@preconcurrency import Kingfisher

struct ItemPlaceView: View {
    
    let place: PlaceModel?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .bottomLeading) {
                KFImage.url(URL(string: place?.gambar ?? ""))
                    .placeholder{
                        Image("PlaceholderLoading")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                    }
                    .onFailureView { Image("PlaceholderError").resizable() }
                    .fade(duration: 1)
                    .cancelOnDisappear(true)
                    .fade(duration: 0.25)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: 180)
                    .clipped()
                VStack (alignment: .leading){
                    Text(place?.nama ?? "")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        .padding(EdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                    Text(place?.lokasi ?? "")
                        .font(.body)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        .padding(EdgeInsets.init(top: 0, leading: 8, bottom: 8, trailing: 8))
                }
            }
        }
        .frame(height: 180)
    }
    
}

struct ItemPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        ItemPlaceView(place: nil)
    }
}
