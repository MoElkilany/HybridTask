//
//  SegmentedControlTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit

class SegmentedControlTableCell: UITableViewCell,CustomCell {
   

    @IBOutlet weak var productDescriptionBtn: UIButton!
    @IBOutlet weak var productDescriptioView: UIView!

    @IBOutlet weak var additionalInfoBtn: UIButton!
    @IBOutlet weak var additionalInfoView: UIView!

    @IBOutlet weak var customerReviewBtn: UIButton!
    @IBOutlet weak var customerReviewView: UIView!

    var viewModel: ProductDetailsViewModel? 
    var itemModel: Item?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectedButton(button: productDescriptionBtn, view: productDescriptioView)
        unSelectedButton(button: additionalInfoBtn, view: additionalInfoView)
        unSelectedButton(button: customerReviewBtn, view: customerReviewView)
    
    }
    
    func configure(withModel model: any CustomCellEntity) {
        let cellEntity = model as? ProductDetailsCellEntity
        let entityViewModel = cellEntity?.viewModel as? ProductDetailsViewModel
        viewModel = entityViewModel
        if  let modelData = cellEntity?.model as? Item {
            self.itemModel = modelData
        }
    }

  
    
    @IBAction func productDescriptionBtn(_ sender: Any) {
        selectedButton(button: productDescriptionBtn, view: productDescriptioView)
        unSelectedButton(button: additionalInfoBtn, view: additionalInfoView)
        unSelectedButton(button: customerReviewBtn, view: customerReviewView)
        
        if  let modelData = itemModel {
            viewModel?.drawProductDetailsCells(for: modelData)
        }
  
    }
    
    @IBAction func additionalInfoBtn(_ sender: Any) {
        selectedButton(button: additionalInfoBtn, view: additionalInfoView)
        unSelectedButton(button: customerReviewBtn, view: customerReviewView)
        unSelectedButton(button: productDescriptionBtn, view: productDescriptioView)
        
        if  let modelData = itemModel {
            viewModel?.drawAdditionalInfoCells(for: modelData)
        }
    }
    
    @IBAction func customerReviewBtn(_ sender: Any) {
        selectedButton(button: customerReviewBtn, view: customerReviewView)
        unSelectedButton(button: productDescriptionBtn, view: productDescriptioView)
        unSelectedButton(button: additionalInfoBtn, view: additionalInfoView)
        
        if  let modelData = itemModel {
            viewModel?.drawCustomerReviewCells(for: modelData)
        }
    }
    
    
    func selectedButton(button:UIButton,view:UIView){
        UIView.animate(withDuration: 0.2) {
            button.tintColor = .black
            view.backgroundColor = .black
        }
    }
    
    func unSelectedButton(button:UIButton,view:UIView){
        UIView.animate(withDuration: 0.2) {
            button.tintColor = .lightGray
            view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        }
    }
}
