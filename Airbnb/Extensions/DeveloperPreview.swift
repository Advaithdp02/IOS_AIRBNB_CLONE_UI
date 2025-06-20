//
//  DeveloperPreview.swift
//  Airbnb
//
//  Created by Adu on 20/06/25.
//

import Foundation

class DeveloperPreview{
    static let shared=DeveloperPreview()
    
    var listings: [Listing] = [
            .init(
                id: UUID().uuidString,
                ownerUid: "John Doe",
                ownerImageUrl: "male-profile-photo",
                numberOfbedrooms: 2,
                numberOfbathrooms: 1,
                numberOfguests: 4,
                numberOfbeds: 2,
                pricePerNight: 120,
                latitude: 37.7749,
                longitude: -122.4194,
                imageURLS: ["listing-1","listing-2","listing-3"],
                address: "123 Market St",
                city: "San Francisco",
                state: "CA",
                title: "Cozy Apartment in SF",
                rating: 4.8,
                features: [.SelfCheckIn], // Example features
                amenities: [.wifi, .kitchen, .tv],
                type: .apartment // Example type
            ),
            .init(
                id: UUID().uuidString,
                ownerUid: "user456",
                ownerImageUrl: "male-profile-photo",
                numberOfbedrooms: 3,
                numberOfbathrooms: 2,
                numberOfguests: 6,
                numberOfbeds: 3,
                pricePerNight: 200,
                latitude: 34.0522,
                longitude: -118.2437,
                imageURLS: ["listing-2","listing-3","listing-1"],
                address: "456 Sunset Blvd",
                city: "Los Angeles",
                state: "CA",
                title: "Modern House in LA",
                rating: 4.9,
                features: [.SelfCheckIn, .superHost],
                amenities: [.pool, .wifi, .laundry, .balcony],
                type: .house
            ),
            .init(
                id: UUID().uuidString,
                ownerUid: "user789",
                ownerImageUrl: "male-profile-photo",
                numberOfbedrooms: 1,
                numberOfbathrooms: 1,
                numberOfguests: 2,
                numberOfbeds: 1,
                pricePerNight: 90,
                latitude: 40.7128,
                longitude: -74.0060,
                imageURLS: ["listing-3","listing-1","listing-2"],
                address: "789 Broadway",
                city: "New York",
                state: "NY",
                title: "Stylish Studio in NYC",
                rating: 4.5,
                features: [.SelfCheckIn,.superHost],
                amenities: [.wifi, .kitchen, .office],
                type: .townhouse
            )
        ]
}
