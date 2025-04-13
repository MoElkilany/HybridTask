//
//  SwiftUIProductDetailsViewModel.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//

import SwiftUI
import Combine

class  SwiftUIProductDetailsViewModel: ObservableObject {
    
    @Published var productInfo: Item?
    @Published var quantityNumber: String = "1"
        
     func fetchProductDetails() {
        if let url = Bundle.main.url(
            forResource: "Response",
            withExtension: "json"
        ) {
            do {
                let data = try Data(contentsOf: url)
                let decodedResponse = try JSONDecoder().decode(
                    ProductDetailsResponse.self,
                    from: data
                )
                productInfo = decodedResponse.data?.products?.items?.first
            } catch {
                print("Error decoding: \(error)")
            }
        }
    }
    
        
    func pricePerQuantity() -> Int {
        
        let price = productInfo?.priceRange?.maximumPrice?.regularPrice?.value ?? 0
        let sum = price * (Int(quantityNumber ) ?? 1)
        return  sum
    }
}

