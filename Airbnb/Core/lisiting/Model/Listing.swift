//
//  Listing.swift
//  Airbnb
//
//  Created by Adu on 20/06/25.
//

import Foundation


struct Listing :Identifiable,Codable,Hashable{
    let id: String
    let ownerUid: String
    let ownerImageUrl: String
    let numberOfbedrooms: Int
    let numberOfbathrooms: Int
    let numberOfguests: Int
    let numberOfbeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    var imageURLS:[String]
    let address: String
    let city: String
    let state: String
    let title: String
    let rating: Double
    var features:[ListingFeatures]
    var amenities:[ListingAmenities]
    let type:ListingType
    
}
enum ListingFeatures: Int,Codable,Identifiable,Hashable{
    case SelfCheckIn
    case superHost
    var imageName : String{
        switch self{
        case .SelfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    var id: Int{
        return self.rawValue
    }
    var title: String{
        switch self{
        case .superHost: return "Superhost"
        case .SelfCheckIn : return "Self Check-In"
        }
    }
    var subtitle : String {
        switch self{
        case .SelfCheckIn : return "Check yourself with keypad"
        case .superHost : return "Superhosts are experienced , highly rated  hosts who are commited to providing great stars for their guests"
        }
    }
    
    
}
enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony

    var id: Int {
        return self.rawValue
    }

    var title: String {
        switch self {
        case .pool:
            return "Pool"
        case .kitchen:
            return "Kitchen"
        case .wifi:
            return "Wi-Fi"
        case .laundry:
            return "Laundry"
        case .tv:
            return "TV"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        }
    }

    var imageName: String {
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .kitchen:
            return "fork.knife"
        case .wifi:
            return "wifi"
        case .laundry:
            return "washer"
        case .tv:
            return "tv"
        case .alarmSystem:
            return "checkboard.shield"
        case .office:
            return "pencil.add.ruler.fill"
        case .balcony:
            return "building"
        }
    }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townhouse
    case villa
    
    var id: Int {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .apartment:return "Apartment"
        case .house:return "House"
        case .townhouse:return "Townhouse"
        case .villa:return "Villa"
            
        }
    }
}
