import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchview=false
    @StateObject var viewModel=ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            if(showDestinationSearchview){
                DestinationSearchView(show: $showDestinationSearchview)
            }
            else{
                ScrollView {
                    searchAndFilterView()
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchview.toggle()
                            }
                            
                        }
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                listingView(listing:listing)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
                .navigationDestination(for: Listing.self) { listing in
                    // Replace this with the destination view you want
                    ListingDetailView(listing:listing)
                        .navigationBarBackButtonHidden()
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
