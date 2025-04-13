//
//  ProductPriceTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit
import Combine

class ProductPriceTableCell: UITableViewCell,CustomCell{
 
    @IBOutlet weak var containerTextView: UIView!
    @IBOutlet weak var quantityTF: UITextField!
    
    @IBOutlet weak var priceLbl: StandardLabel_Bold16!
    @IBOutlet weak var priceCurrancyLbl: StandardLabel_Bold16!
    @IBOutlet weak var changeCurrancyLbl: StandardLabel_Bold16!
    private var cancellables = Set<AnyCancellable>()
    
    var viewModel :ProductDetailsViewModel? 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        quantityTF.placeholder = "1"
        containerTextView.backgroundColor = .clear
        containerTextView.layer.cornerRadius = 12
        containerTextView.layer.masksToBounds = true
        containerTextView.layer.borderWidth = 1
        containerTextView.layer.borderColor = UIColor.systemBlue.cgColor
    }
    

    func configure(withModel model: any CustomCellEntity) {
        
        let cellEntity = model as? ProductDetailsCellEntity
        let modelData = cellEntity?.model as? Item
        let viewModel = cellEntity?.viewModel as? ProductDetailsViewModel
          self.viewModel = viewModel
        
        
        
        priceLbl.text = ArabicNumberFormatter.formattedArabicNumber(modelData?.priceRange?.maximumPrice?.regularPrice?.value ?? 0)
        priceCurrancyLbl.text = modelData?.priceRange?.maximumPrice?.regularPrice?.currency == "YER" ? "ريال جديد" : "USD"
        
        
        let attributedString = NSAttributedString(
            string: changeCurrancyLbl.text ?? "" ,
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: UIColor.systemBlue
            ]
        )
        changeCurrancyLbl.attributedText = attributedString
                
    }

   
    
}
