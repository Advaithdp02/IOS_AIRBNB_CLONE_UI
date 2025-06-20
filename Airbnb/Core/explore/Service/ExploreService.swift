//
//  ExploreService.swift
//  Airbnb
//
//  Created by Adu on 20/06/25.
//

import Foundation

class ExploreService{
    func fetchListings() async throws ->[Listing]{
        return DeveloperPreview.shared.listings
    }
}
