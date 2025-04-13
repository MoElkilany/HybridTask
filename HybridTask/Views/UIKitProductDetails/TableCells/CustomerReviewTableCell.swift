//
//  CustomerReviewTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit

class CustomerReviewTableCell: UITableViewCell,CustomCell {
  
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var bottomContainerView: UIView!

    @IBOutlet weak var ratingSummaryLbl: StandardLabel_Bold24!
    @IBOutlet weak var ratingSummary2Lbl: StandardLabel_Bold16!
    
    @IBOutlet weak var customerRate: StandardLabel_Bold24!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topContainerView.layer.cornerRadius = 8
        bottomContainerView.layer.masksToBounds = true
        bottomContainerView.layer.cornerRadius = 8
        bottomContainerView.layer.borderWidth = 0.2
        bottomContainerView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(withModel model: any CustomCellEntity) {
        let cellEntity = model as? ProductDetailsCellEntity
        if  let modelData = cellEntity?.model as? Item {
            ratingSummaryLbl.text =  String(modelData.reviewCount ?? 0)
            ratingSummary2Lbl.text =  String(modelData.ratingSummary ?? 0)
            customerRate.text = String(modelData.ratingSummary ?? 0)
        }
    }
    
}
