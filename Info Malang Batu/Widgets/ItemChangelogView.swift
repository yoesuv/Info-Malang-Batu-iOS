//
//  ItemChangelogView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import SwiftUI

struct ItemChangelogView: View {
    
    let changelog: ChangelogModel?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(changelog?.version ?? "")
                .font(.body)
                .fontWeight(.bold)
            HtmlText(changelog?.information ?? "")
                .font(.title)
            Divider()
        }
        .padding(.horizontal, 10)
        .padding(.top, 10)
    }
}

struct ItemChangelogView_Previews: PreviewProvider {
    static var previews: some View {
        ItemChangelogView(changelog: nil)
    }
}
