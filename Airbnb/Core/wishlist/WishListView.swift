//
//  WishListView.swift
//  Airbnb
//
//  Created by Adu on 16/06/25.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 32){
                VStack(alignment: .leading,spacing: 4){
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    Text("You can create, view or edit wishlists once you've logged in ")
                        .font(.footnote)
                    
                }
                Button{
                    print("Log in")
                }label: {
                    Text("log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }.navigationTitle("Wishlists")
                .padding()
            
        }
    }
}

#Preview {
    WishListView()
}
