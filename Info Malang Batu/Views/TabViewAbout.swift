//
//  TabViewAbout.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct TabViewAbout: View {
    
    @State var selectedTab:Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                AppBar(index: $selectedTab)
                TabView(selection: $selectedTab) {
                    SwipeTabAbout().tag(0)
                    SwipeTabChangelog().tag(1)
                    SwipeTabLibraries().tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct AppBar: View {
    
    @Binding var index: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Spacer().frame(width: 10)
                Button(action: {
                    setSelected(index: 0)
                }, label: {
                    Text("About")
                })
                Button(action: {
                    setSelected(index: 1)
                }, label: {
                    Text("Changelog")
                })
                Button(action: {
                    setSelected(index: 2)
                }, label: {
                    Text("Libraries")
                })
            }
        }
    }
    
    func setSelected(index: Int) {
        withAnimation {
            self.index = index
        }
    }
}

struct TabViewAbout_Previews: PreviewProvider {
    static var previews: some View {
        TabViewAbout()
    }
}
