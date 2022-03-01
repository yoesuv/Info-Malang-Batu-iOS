//
//  ItemCheckListPlace.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 25/02/22.
//

import Foundation
import SwiftUI

struct ItemCheckListPlace: View {
    
    @State var filter: FilterItemListPlaceModel
    @Binding var selectedFilter: FilterItemListPlaceModel
    @Binding var showMenuListPlace: Bool
    var completion: (Location) -> Void
        
    var body: some View {
        HStack {
            Text(filter.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.black.opacity(0.7))
            Spacer()
            ZStack {
                Circle()
                    .stroke(filter.location == selectedFilter.location ? .green : Color.gray, lineWidth:  1)
                    .frame(width: 26, height: 26)
                if (filter.location == selectedFilter.location) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.green)
                }
            }
            .frame(width: 26, height: 26)
        }
        .padding(.horizontal)
        .contentShape(Rectangle())
        .onTapGesture {
            self.selectedFilter = filter
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                completion(filter.location)
                withAnimation {
                    showMenuListPlace.toggle()
                }
            }
        }
    }
}
