//
//  ProductDescriptionTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit

class ProductDescriptionTableCell: UITableViewCell,CustomCell {
    
    @IBOutlet weak var productDescriptionLbl: StandardLabel_Regular12!
    
    @IBOutlet weak var productNumberLbl: StandardLabel_Regular12!
    
    @IBOutlet weak var productNumberValueLbl: StandardLabel_Regular12!
    
    @IBOutlet weak var productVendorValueLbl: StandardLabel_Regular12!
    @IBOutlet weak var productVendorLbl: StandardLabel_Regular12!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withModel model: any CustomCellEntity) {
        let cellEntity = model as? ProductDetailsCellEntity
        let modelData = cellEntity?.model as? Item
        productDescriptionLbl.text = modelData?.name ?? ""
        productNumberLbl.text = "  كود المنتج : "
        productNumberValueLbl.text = modelData?.sku ?? "" 
        productVendorLbl.text = "البائع:"
        productVendorValueLbl.text = modelData?.vendorInfo?.storeName  ?? ""
        
    }

}
