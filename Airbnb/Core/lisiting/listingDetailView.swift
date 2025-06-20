//
//  listingDetailView.swift
//  Airbnb
//
//  Created by Adu on 15/05/25.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition

    init(listing: Listing) {
        self.listing = listing
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        self._cameraPosition = State(initialValue: .region(region))
    }

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                listingImageCarasoulView(listing: listing)
                    .frame(height: 320)
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("\(listing.title)")
                    .font(.title)
                    .fontWeight(.semibold)

                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "star.fill")
                        Text("\(listing.rating)")
                        Text("-")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    .font(.caption)
                }

                Text("\(listing.city), \(listing.state)")
            }
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

            Divider()

            HStack {
                VStack(alignment: .leading) {
                    Text("Entire \(listing.type) Hosted By \(listing.ownerUid)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)

                    HStack(spacing: 2) {
                        Text("\(listing.numberOfguests) guest-")
                        Text("\(listing.numberOfbedrooms) Bedroom-")
                        Text("\(listing.numberOfbeds) beds-")
                        Text("\(listing.numberOfbathrooms) Baths")
                    }
                    .font(.caption)
                    .frame(width: 300, alignment: .leading)
                }
                Spacer()
                Image("\(listing.ownerImageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()

            Divider()

            VStack {
                ForEach(listing.features) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding()

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                Text("Where You'll sleep")
                    .font(.headline)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1...listing.numberOfbedrooms, id: \.self) { bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()

            Divider()

            VStack(spacing: 16) {
                Text("What this place offers")
                    .font(.headline)

                ForEach(listing.amenities, id: \.self) { feature in
                    HStack {
                        Image(systemName: feature.imageName)
                            .frame(width: 32)
                        Text(feature.title)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)

                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("$\(listing.pricePerNight)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Total before taxes")
                        .font(.footnote)
                    Text("Oct 15-20")
                        .font(.footnote)
                        .underline()
                        .fontWeight(.semibold)
                }
                Spacer()
                Button {
                    // Action for Reserve button
                } label: {
                    Text("Reserve")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 140, height: 40)
                        .background(.pink)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
