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
                Color(uiColor: UIColor(named: "Brown500") ?? .brown)
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
        Task { @MainActor in
            try? await Task.sleep(for: .seconds(2))
            withAnimation {
                isActive = true
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
