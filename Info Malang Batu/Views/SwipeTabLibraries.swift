//
//  SwipeTabLibraries.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 08/02/22.
//

import SwiftUI

struct SwipeTabLibraries: View {
    
    @ObservedObject var viewModel = LibraryViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.libraries) { item in
                    ItemLibraryView(library: item)
                }
            }
        }
    }
}

struct SwipeTabLibraries_Previews: PreviewProvider {
    static var previews: some View {
        SwipeTabLibraries()
    }
}
