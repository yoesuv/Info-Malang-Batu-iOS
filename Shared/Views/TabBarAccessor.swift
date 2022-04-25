//
//  TabBarAccessor.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 26/04/22.
//
import SwiftUI

// https://gist.github.com/TuenTuenna/ad16f07645e59ef8e115fda8e0511031
struct TabBarAccessor: UIViewControllerRepresentable {
    var callback: (UITabBar) -> Void
    private let proxyController = ViewController()

    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarAccessor>) ->
                              UIViewController {
        proxyController.callback = callback
        return proxyController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TabBarAccessor>) {
    }

    typealias UIViewControllerType = UIViewController


    private class ViewController: UIViewController {
        var callback: (UITabBar) -> Void = { _ in }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let tabBar = self.tabBarController {
                self.callback(tabBar.tabBar)
            }
        }
    }
}


extension View {
    func setTabBarVisibility(isHidden : Bool) -> some View {
      background(TabBarAccessor { tabBar in
          tabBar.isHidden = isHidden
      })
    }
}
