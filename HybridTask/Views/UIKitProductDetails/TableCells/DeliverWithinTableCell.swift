//
//  DeliverWithinTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit
import SVGKit

class DeliverWithinTableCell: UITableViewCell,CustomCell {
 
    
    @IBOutlet weak var deliverIcon: SVGKFastImageView!
    @IBOutlet weak var deliverWithinLbl: StandardLabel_Bold12!
    @IBOutlet weak var deliverWithinValueLbl: StandardLabel_Bold12!
    @IBOutlet weak var inStockLbl: StandardLabel_Bold12!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    func configure(withModel model: any CustomCellEntity) {
        let cellEntity = model as? ProductDetailsCellEntity
        let modelData = cellEntity?.model as? Item
        
        if let icon = modelData?.shipTo?.icon, !icon.isEmpty {
            loadSVG(from: icon)
        }
        deliverWithinValueLbl.text = modelData?.shipTo?.period ?? ""
        deliverWithinLbl.text = modelData?.shipTo?.shipToPrefix ?? ""
        inStockLbl.text = modelData?.stockStatus  == "IN_STOCK"  ? "متوفر في المخزن" : "-"
    }
    
    private func loadSVG(from svgString: String) {
        guard let data = svgString.data(using: .utf8) else {
            return
        }
        let svgImage = SVGKImage(data: data)
                if let svgImage = svgImage {
            self.deliverIcon.image = svgImage
        }
    }
}
