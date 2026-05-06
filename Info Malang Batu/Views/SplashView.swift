//
//  ContentView.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            if isActive {
                HomeView()
                    .transition(.opacity)
            } else {
                Color(uiColor: UIColor(named: "Brown500")!)
                VStack(alignment: .center) {
                    Text("Info Malang Batu")
                        .font(.custom("pacifico", size: 32))
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            goToHome()
        }
    }
    
    func goToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            withAnimation {
                self.isActive = true
            }
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
