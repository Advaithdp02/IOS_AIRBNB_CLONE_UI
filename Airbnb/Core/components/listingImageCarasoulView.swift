//
//  listingImageCarasoulView.swift
//  Airbnb
//
//  Created by Adu on 15/05/25.
//

import SwiftUI

struct listingImageCarasoulView: View {
    let listing: Listing
    var body: some View {
        TabView{
            ForEach(listing.imageURLS, id: \.self){ image in
                Image(image).resizable()  .scaledToFill()
        }
        }
            .tabViewStyle(.page)
    }
}

#Preview {
    listingImageCarasoulView(listing:DeveloperPreview.shared.listings[0])
}
