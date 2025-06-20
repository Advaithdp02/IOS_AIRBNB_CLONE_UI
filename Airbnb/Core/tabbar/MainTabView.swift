//
//  MainTabView.swift
//  Airbnb
//
//  Created by Adu on 16/06/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem{Label("Explore",systemImage:"magnifyingglass")}
            WishListView()
                .tabItem{Label("Wishlists",systemImage:"heart")}
            ProfileView()
                .tabItem{Label("Profile",systemImage:"person")}
        }
    }
}

#Preview {
    MainTabView()
}
