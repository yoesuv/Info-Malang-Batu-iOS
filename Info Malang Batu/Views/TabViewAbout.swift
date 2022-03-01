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
    private let brown = Color(UIColor(named: "Brown500")!)
    
    var body: some View {
        ZStack {
            brown
                .frame(height: 45)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    Spacer().frame(width: 10)
                    Button(action: {
                        setSelected(index: 0)
                    }, label: {
                        Text("About")
                            .foregroundColor(self.index == 0 ? .white : Color.white.opacity(0.7))
                    })
                    Button(action: {
                        setSelected(index: 1)
                    }, label: {
                        Text("Changelog")
                            .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.7))
                    })
                    Button(action: {
                        setSelected(index: 2)
                    }, label: {
                        Text("Libraries")
                            .foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.7))
                    })
                }
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
