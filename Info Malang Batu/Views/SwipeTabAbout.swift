//
//  SwipeTabAbout.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 08/02/22.
//

import SwiftUI

struct SwipeTabAbout: View {
    
    let appVersion: String = Bundle.main.releaseVersionNumber ?? "1.0.0"
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer().frame(height: 10)
            Text("Info Malang Batu")
                .font(.title2)
                .fontWeight(.bold)
            Text("Version "+appVersion)
                .font(.body)
            Text("iOS Version")
                .font(.body)
            Text("https://github.com/yoesuv")
                .font(.callout)
            Spacer()
        }
    }
}

struct SwipeTabAbout_Previews: PreviewProvider {
    static var previews: some View {
        SwipeTabAbout()
    }
}
