//
//  listingView.swift
//  Airbnb
//
//  Created by Adu on 12/05/25.
//

import SwiftUI

struct listingView: View {
    let listing:Listing
    var body: some View {
        VStack(spacing:8){
            //image
            listingImageCarasoulView(listing: listing)
                
            .frame(height:320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
                
            
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("\(listing.city) , \(listing.state)").fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away").foregroundStyle(.gray)
                    Text("Nov 3 - Nov 12").foregroundStyle(.gray)
                    HStack{
                        Text("$\(listing.pricePerNight)").fontWeight(.semibold)
                        Text("night")
                        
                    }.foregroundStyle(.black)
                }
                Spacer()
                HStack{
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                }.foregroundStyle(.black)
            }.padding()
        }.padding()
            
        
            
        }
    }


#Preview {
    listingView(listing: DeveloperPreview.shared.listings[0])
}
