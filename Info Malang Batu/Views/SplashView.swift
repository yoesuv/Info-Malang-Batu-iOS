//
//  ContentView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    let home = HomeView()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                VStack(alignment: .center) {
                    Text("Info Malang Batu")
                        .font(.title)
                        .padding()
                    NavigationLink(
                        destination: home,
                        isActive: $isActive,
                        label: {
                            EmptyView()
                        }
                    )
                }
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
        }.onAppear(perform: {
            goToHome()
        })
    }
    
    func goToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.isActive = true
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
