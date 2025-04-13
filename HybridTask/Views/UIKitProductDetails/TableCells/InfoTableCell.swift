//
//  InfoTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit

class InfoTableCell: UITableViewCell{
    

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var keyLbl: StandardLabel_Bold12!
    @IBOutlet weak var valueLbl: StandardLabel_Bold12!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = .blue.withAlphaComponent(0.1)
    }

   
    
    func configure(with attribute: ItemAttribute) {
        keyLbl.text = attribute.label
        valueLbl.text = attribute.value
       }
    
    
}
