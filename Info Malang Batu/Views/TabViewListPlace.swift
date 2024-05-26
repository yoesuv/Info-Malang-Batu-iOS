//
//  TabViewListPlace.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI
import AlertToast

struct TabViewListPlace: View {
    
    @ObservedObject var viewModel = ListPlaceViewModel(NetworkService())
    @State private var showMenuListPlace = false
    @State private var selectedFilter = FilterItemListPlaceModel(title: "Semua", location: Location.semua)
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.places) { place in
                            NavigationLink(destination: ListPlaceDetailView(place: place)) {
                                ItemPlaceView(place: place)
                            }
                        }
                    }
                }
                .navigationTitle("List Place")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    withAnimation {
                        showMenuListPlace.toggle()
                    }
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.white)
                }))
            }
            // bottom dialog custom
            VStack {
                Spacer()
                VStack(spacing: 18) {
                    ForEach(viewModel.filters) { filter in
                        ItemCheckListPlace(filter: filter, selectedFilter: self.$selectedFilter, showMenuListPlace: $showMenuListPlace, completion: { location in
                            loadPlace(location)
                        })
                    }
                }
                .padding(.bottom, 20)
                .padding(.top, 35)
                .background(Color.white.clipShape(CustomCorner(corners: [.topLeft, .topRight])))
                .offset(y: showMenuListPlace ? 0 : UIScreen.main.bounds.height / 2)
            }
            .edgesIgnoringSafeArea(.top)
            .background(
                Color.black.opacity(0.3).ignoresSafeArea()
                    .opacity(showMenuListPlace ? 1:0)
                    .onTapGesture {
                        withAnimation {
                            showMenuListPlace.toggle()
                        }
                    }
            )
        }
        .onAppear {
            viewModel.fetchPlaces(self.selectedFilter.location)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .toast(isPresenting: $viewModel.loading, alert: {
            AlertToast.init(type: .loading)
        })
    }

    func loadPlace(_ location: Location) {
        print("TabViewListPlace # \(#function) : \(location)")
        viewModel.fetchPlaces(location)
    }

}

struct CustomCorner: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

struct TabViewListPlace_Previews: PreviewProvider {
    static var previews: some View {
        TabViewListPlace()
    }
}
