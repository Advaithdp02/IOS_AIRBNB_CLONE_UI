//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Adu on 20/06/25.
//

import Foundation
class ExploreViewModel:ObservableObject{
    @Published var listings = [Listing]()
    private let service:ExploreService
    init(service: ExploreService){
        self.service=service
        Task{
            await fetchListings()
        }
    }
    func fetchListings() async{
        do{
            self.listings=try await service.fetchListings()
        }catch{
            print("DEBUG FAILED TO FETCH LISTING WITH ERROR:\(error.localizedDescription)")
        }
        
    }
}
