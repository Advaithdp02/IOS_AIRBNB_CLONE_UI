//
//  searchAndFilterView.swift
//  Airbnb
//
//  Created by Adu on 13/05/25.
//

import SwiftUI

struct searchAndFilterView: View {
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            VStack(alignment: .leading, spacing:2){
                Text("Where To?").fontWeight(.semibold)
                Text("Anywhere - Anytime - Add Guests").font(.caption2).foregroundStyle(.gray )
            }.font(.footnote)
            
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle").foregroundColor(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .overlay{
            Capsule().stroke(lineWidth: 0.6).foregroundStyle(Color(.systemGray4)).shadow(color:.black.opacity(0.4),radius: 2)
        }
    }
}

#Preview {
    searchAndFilterView()
}
