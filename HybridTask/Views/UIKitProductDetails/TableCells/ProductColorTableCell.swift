//
//  ProductColorTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit

class ProductColorTableCell: UITableViewCell,CustomCell {
    
    @IBOutlet weak var colorValuLbl: StandardLabel_Bold12!
    @IBOutlet weak var colorCollection: UICollectionView!
    

    var itemModel: Item?
    var selectedColorIndex: Int?
    var colorValues: [ValueModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        colorCollection.delegate = self
        colorCollection.dataSource = self
        colorCollection.register(UINib(nibName: ColorCollectionCell.getName(), bundle: nil), forCellWithReuseIdentifier: ColorCollectionCell.getName())
        
        let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           layout.minimumInteritemSpacing = 8
           layout.minimumLineSpacing = 8
           colorCollection.collectionViewLayout = layout
           
           colorCollection.delegate = self
           colorCollection.dataSource = self
           colorCollection.showsHorizontalScrollIndicator = false

        
        
    }

    func configure(withModel model: any CustomCellEntity) {
        let cellEntity = model as? ProductDetailsCellEntity
        if let modelData = cellEntity?.model as? Item {
            itemModel = modelData
            colorValues = modelData.configurableOptions?.first?.values?.reversed() ?? []
            colorCollection.reloadData()
        }
    }
}

extension ProductColorTableCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorValues.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionCell.getName(), for: indexPath) as? ColorCollectionCell else {
            return UICollectionViewCell()
        }

        let colorValue = colorValues[indexPath.item]
        cell.configure(with: colorValue.swatchData?.value ?? "#FFFFFF", isSelected: indexPath.item == selectedColorIndex)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedColorIndex = indexPath.item
        
        let selectedColorValue = colorValues[indexPath.item]
        
        UIView.transition(with: colorValuLbl, duration: 0.25, options: .transitionCrossDissolve, animations: {
            self.colorValuLbl.text = selectedColorValue.label
        }, completion: nil)
        
        collectionView.reloadData()
    }

}
