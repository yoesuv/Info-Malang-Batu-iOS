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
        NavigationStack {
            VStack(spacing: 0) {
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
    }
}

struct AppBar: View {

    @Binding var index: Int
    private let brown = Color(UIColor(named: "Brown500") ?? .brown)
    @Namespace private var animation

    var body: some View {
        ZStack {
            brown
                .frame(height: 50)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    Spacer().frame(width: 10)
                    tabButton(title: "About", tag: 0)
                    tabButton(title: "Changelog", tag: 1)
                    tabButton(title: "Libraries", tag: 2)
                    Spacer().frame(width: 10)
                }
            }
        }
    }

    private func tabButton(title: String, tag: Int) -> some View {
        Button(action: {
            setSelected(index: tag)
        }, label: {
            VStack(spacing: 0) {
                Text(title)
                    .font(.system(size: 15, weight: index == tag ? .bold : .medium))
                    .foregroundColor(index == tag ? .white : Color.white.opacity(0.7))
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 16)

                ZStack {
                    if self.index == tag {
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "underline", in: animation, properties: .frame, anchor: .bottom)
                    } else {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 3)
                    }
                }
            }
            .frame(height: 50)
        })
    }

    func setSelected(index: Int) {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            self.index = index
        }
    }
}

struct TabViewAbout_Previews: PreviewProvider {
    static var previews: some View {
        TabViewAbout()
    }
}
