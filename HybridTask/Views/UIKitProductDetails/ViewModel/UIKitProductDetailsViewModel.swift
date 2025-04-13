//
//  UIKitProductDetailsViewModel.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//

import Combine
import Foundation

class ProductDetailsViewModel {


    private(set) var contentArray = [ProductDetailsCellEntity]()
    private(set) var infoContentArray = [ProductDetailsCellEntity]()

    let productInfoSubject = CurrentValueSubject<Item?, Never>(nil)
    var productInfoPublisher: AnyPublisher<Item?, Never>

    let reloadTableSubject = PassthroughSubject<Void, Never>()
    var reloadTablePublisher: AnyPublisher<Void, Never>

    let quantityNumberSubject = CurrentValueSubject<String, Never>("1")
    var quantityNumberPublisher: AnyPublisher<String, Never>

    private var cancellables = Set<AnyCancellable>()


    init() {
        productInfoPublisher = productInfoSubject.eraseToAnyPublisher()
        reloadTablePublisher = reloadTableSubject.eraseToAnyPublisher()
        quantityNumberPublisher = quantityNumberSubject.eraseToAnyPublisher()
    }


    func fetchProductDetails() {
        if let url = Bundle.main.url(forResource: "Response", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedResponse = try JSONDecoder().decode(ProductDetailsResponse.self, from: data)

                if let product = decodedResponse.data?.products?.items?.first {
                    productInfoSubject.send(product)
                    drawProductDetailsCells(for: product)
                }
            } catch {
                print("Error decoding product details: \(error)")
            }
        }
    }


    private var productDetailsCellTypes: [ProductDetailsCellType] {
        [
            .LocalProductTableCell,
            .ImageSliderProductTableCell,
            .ProductDescriptionTableCell,
            .DeliverWithinTableCell,
            .ProductPriceTableCell,
            .ProductColorTableCell,
            .SegmentedControlTableCell,
            .HTMLDescriptionTableCell
        ]
    }

    private var additionalInfoCellTypes: [ProductDetailsCellType] {
        [
            .LocalProductTableCell,
            .ImageSliderProductTableCell,
            .ProductDescriptionTableCell,
            .DeliverWithinTableCell,
            .ProductColorTableCell,
            .ProductPriceTableCell,
            .SegmentedControlTableCell,
            .AdditionalInfoTableCell
        ]
    }

    private var customerReviewCellTypes: [ProductDetailsCellType] {
        [
            .LocalProductTableCell,
            .ImageSliderProductTableCell,
            .ProductDescriptionTableCell,
            .DeliverWithinTableCell,
            .ProductPriceTableCell,
            .ProductColorTableCell,
            .SegmentedControlTableCell,
            .CustomerReviewTableCell
        ]
    }


    func drawProductDetailsCells(for product: Item) {
        buildContentArray(for: product, using: productDetailsCellTypes)
    }

    func drawAdditionalInfoCells(for product: Item) {
        buildContentArray(for: product, using: additionalInfoCellTypes)
    }

    func drawCustomerReviewCells(for product: Item) {
        buildContentArray(for: product, using: customerReviewCellTypes)
    }


    private func buildContentArray(for product: Item, using cellTypes: [ProductDetailsCellType]) {
        contentArray.removeAll()

        contentArray.append(contentsOf: cellTypes.map {
            ProductDetailsCellEntity(type: $0, model: product, viewModel: self)
        })

        reloadTableSubject.send()
    }


    var productInfo: Item? {
        return productInfoSubject.value
    }

    var quantityNumber: String {
        return quantityNumberSubject.value
    }

    func pricePerQuantity() -> Int {
        let price = productInfo?.priceRange?.maximumPrice?.regularPrice?.value ?? 0
        let quantity = Int(quantityNumber) ?? 1
        return price * quantity
    }
}
