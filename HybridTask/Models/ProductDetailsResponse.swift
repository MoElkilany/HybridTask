//
//  ProductResponse.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//

import Foundation

struct ProductDetailsResponse: Codable {
    let data: ProductDetailsValue?
}

struct ProductDetailsValue: Codable {
    let products: Products?
}

struct Products: Codable {
    let items: [Item]?
}

struct Item: Codable {

    
    let salableQty: Int?
    let stockStatus: String?
    let id: Int?
    let name, sku, typeID: String?
    let approval: Int?
    let shipTo: ShipTo?
    let labels: [LabelModel]?
    let description: Description?
    let smallImage: SmallImage?
    let urlRewrites: [SmallImage]?
    let priceRange: PriceRange?
    let categories: [Category]?
    let mediaGallery: [SmallImage]?
    let ratingSummary, reviewCount, reviewAvailability: Int?
    let reviews: Products?
    let attributes: [ItemAttribute]?
    let vendorInfo: VendorInfo?
    let productFeatures: ProductFeatures?
    let configurableOptions: [ConfigurableOption]?
    let variants: [Variant]?

    enum CodingKeys: String, CodingKey {
        case salableQty = "salable_qty"
        case stockStatus = "stock_status"
        case id, name, sku
        case typeID = "type_id"
        case approval
        case shipTo = "ship_to"
        case labels, description
        case smallImage = "small_image"
        case urlRewrites = "url_rewrites"
        case priceRange = "price_range"
        case categories
        case mediaGallery = "media_gallery"
        case ratingSummary = "rating_summary"
        case reviewCount = "review_count"
        case reviewAvailability = "review_availability"
        case reviews, attributes, vendorInfo
        case productFeatures = "product_features"
        case configurableOptions = "configurable_options"
        case variants
    }
}



struct ItemAttribute:Codable,Hashable  {
    var label, code, value: String?
}

struct Category: Codable {
    let id: Int?
    let name: String?
}

struct ConfigurableOption: Codable {
    let id: Int?
    let label: String?
    let position: Int?
    let attributeCode: String?
    let values: [ValueModel]?
    let productID: Int?

    enum CodingKeys: String, CodingKey {
        case id, label, position
        case attributeCode = "attribute_code"
        case values
        case productID = "product_id"
    }
}

struct ValueModel: Codable {
    let valueIndex: Int?
    let label: String?
    let swatchData: SwatchData?

    enum CodingKeys: String, CodingKey {
        case valueIndex = "value_index"
        case label
        case swatchData = "swatch_data"
    }
}

struct SwatchData: Codable {
    let value: String?
}

struct Description: Codable {
    let html: String?
}

struct LabelModel: Codable {
    let title, labelText, labelImage, backgroundImage: String?
    let customStyle: String?

    enum CodingKeys: String, CodingKey {
        case title
        case labelText = "label_text"
        case labelImage = "label_image"
        case backgroundImage = "background_image"
        case customStyle = "custom_style"
    }
}

struct SmallImage: Codable {
    let url: String?
}

struct PriceRange: Codable {
    let maximumPrice, minimumPrice: ImumPrice?

    enum CodingKeys: String, CodingKey {
        case maximumPrice = "maximum_price"
        case minimumPrice = "minimum_price"
    }
}

struct ImumPrice: Codable {
    let regularPrice, regularPriceBase, finalPrice, finalPriceBase: FinalPrice?
    let discount, discountBase: Discount?

    enum CodingKeys: String, CodingKey {
        case regularPrice = "regular_price"
        case regularPriceBase = "regular_price_base"
        case finalPrice = "final_price"
        case finalPriceBase = "final_price_base"
        case discount
        case discountBase = "discount_base"
    }
}

struct Discount: Codable {
    let amountOff, percentOff: Int?

    enum CodingKeys: String, CodingKey {
        case amountOff = "amount_off"
        case percentOff = "percent_off"
    }
}

struct FinalPrice: Codable {
    let currency: String?
    let value: Int?
}



struct ProductFeatures: Codable {
    let isPurchased, isTrendy, isFomo: Int?
    let fomoMsg: String?
    let isProductPerformance: Int?
    let productPerformanceMsg: String?

    enum CodingKeys: String, CodingKey {
        case isPurchased = "is_purchased"
        case isTrendy = "is_trendy"
        case isFomo = "is_fomo"
        case fomoMsg = "fomo_msg"
        case isProductPerformance = "is_product_performance"
        case productPerformanceMsg = "product_performance_msg"
    }
}

struct ShipTo: Codable {
    let shipToPrefix, icon, period: String?

    enum CodingKeys: String, CodingKey {
        case shipToPrefix = "prefix"
        case icon, period
    }
}

struct Variant: Codable {
    let product: Product?
    let attributes: [VariantAttribute]?
}

struct VariantAttribute: Codable {
    let uid, label, code: String?
    let valueIndex: Int?

    enum CodingKeys: String, CodingKey {
        case uid, label, code
        case valueIndex = "value_index"
    }
}

struct Product: Codable {
    let id: Int?
    let name, sku: String?
    let salableQty: Int?
    let stockStatus: String?
    let priceRange: PriceRange?
    let mediaGallery: [SmallImage]?
    let approval, weight: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, sku
        case salableQty = "salable_qty"
        case stockStatus = "stock_status"
        case priceRange = "price_range"
        case mediaGallery = "media_gallery"
        case approval, weight
    }
}

struct VendorInfo: Codable {
    let vendorID: Int?
    let productsCount, joinedDate, vendorRegionName, vendorCountry: String?
    let storeName, logoURL: String?

    enum CodingKeys: String, CodingKey {
        case vendorID = "vendor_id"
        case productsCount = "products_count"
        case joinedDate = "joined_date"
        case vendorRegionName = "vendor_region_name"
        case vendorCountry = "vendor_country"
        case storeName = "store_name"
        case logoURL = "logo_url"
    }
}
