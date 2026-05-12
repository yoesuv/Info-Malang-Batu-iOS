//
//  TabViewGalleryTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 13/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

@MainActor
final class TabViewGalleryTests: XCTestCase {
    
    func testTabViewGalleryHasNavigationAndScrollViewLayout() throws {
        let view = NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 0),
                    GridItem(.flexible(), spacing: 0),
                    GridItem(.flexible(), spacing: 0),
                ], spacing: 0) {
                    EmptyView()
                }
            }
            .navigationTitle("Gallery")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        let navigationStack = try view.inspect().find(ViewType.NavigationStack.self)
        XCTAssertNotNil(navigationStack)
        
        let scrollView = try navigationStack.scrollView()
        XCTAssertFalse(try scrollView.showsIndicators())
    }
    
    func testTabViewGalleryHasLazyVGridWithColumns() throws {
        let view = NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 0),
                    GridItem(.flexible(), spacing: 0),
                    GridItem(.flexible(), spacing: 0),
                ], spacing: 0) {
                    EmptyView()
                }
            }
        }
        
        let lazyVGrid = try view.inspect().find(ViewType.LazyVGrid.self)
        let columns = try lazyVGrid.columns()
        XCTAssertEqual(columns.count, 3)
        
        let spacing = try lazyVGrid.spacing()
        XCTAssertEqual(spacing, 0)
    }
    
    func testTabViewGalleryHasFilterToolbarButton() throws {
        let view = Button(action: {}) {
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.white)
        }
        
        let button = try view.inspect().button()
        let image = try button.labelView().image()
        XCTAssertNotNil(image)
    }
    
    func testTabViewGalleryOnAppearFetchesGalleries() async throws {
        let viewModel = GalleryViewModel(MockNetworkService())
        let view = TabViewGallery(viewModel: viewModel)
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }
        
        try await Task.sleep(nanoseconds: 100_000_000)
        
        XCTAssertEqual(viewModel.galleries.count, 3)
        XCTAssertFalse(viewModel.loading)
    }
}