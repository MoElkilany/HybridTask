//
//  ProductDetailsCellEntity.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//

import Foundation
import UIKit
struct ProductDetailsCellEntity : CustomCellEntity {
    var type: CustomCellType
    var model: Item?
    var viewModel: Any?
}


protocol CustomCellType {}
protocol ActionDelegateType {}

protocol CustomCellEntity {
    var type: CustomCellType { get }
}

protocol Interactive {
    var actionDelegate: ActionDelegateType? { get set }
}

protocol CustomCell {
    func configure(withModel model: CustomCellEntity)
}
