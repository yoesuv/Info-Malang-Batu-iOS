//
//  ItemLibraryView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI

struct ItemLibraryView: View {
    
    let library: LibraryModel?
    
    var body: some View {
        VStack (alignment: .leading){
            Text(library?.name ?? "")
                .font(.title3)
                .fontWeight(.bold)
            Text(library?.url ?? "")
                .font(.caption)
            HtmlText(library?.license ?? "")
            Divider()
        }
        .padding(.horizontal, 10)
    }
}

struct ItemLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItemLibraryView(library: nil)
    }
}
