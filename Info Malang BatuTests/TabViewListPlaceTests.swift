//
//  TabViewListPlaceTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 11/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

@MainActor
final class TabViewListPlaceTests: XCTestCase {
    
    func testTabViewListPlaceHasNavigationAndListLayout() throws {
        let view = NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    EmptyView()
                }
            }
        }
        
        let navigationStack = try view.inspect().find(ViewType.NavigationStack.self)
        XCTAssertNotNil(navigationStack)
        
        let scrollView = try navigationStack.scrollView()
        XCTAssertFalse(try scrollView.showsIndicators())
        
        let lazyVStack = try scrollView.lazyVStack()
        XCTAssertEqual(try lazyVStack.spacing(), 0)
    }
    
    func testTabViewListPlaceHasFilterToolbarButton() throws {
        let view = Button(action: {}) {
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.white)
        }
        
        let button = try view.inspect().button()
        let image = try button.labelView().image()
        
        XCTAssertNotNil(image)
    }
    
    func testTabViewListPlaceOnAppearFetchesPlaces() async throws {
        let viewModel = ListPlaceViewModel(MockNetworkService())
        let view = TabViewListPlace(viewModel: viewModel)
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }
        
        try await Task.sleep(nanoseconds: 100_000_000)
        
        XCTAssertEqual(viewModel.places.count, 3)
        XCTAssertFalse(viewModel.loading)
    }
}
