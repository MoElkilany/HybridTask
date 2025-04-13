//
//  ColorCollectionCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit

class ColorCollectionCell: UICollectionViewCell {

    @IBOutlet weak var collectionCellContainer: UIView!
    @IBOutlet weak var filledColorView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionCellContainer.layer.cornerRadius =  collectionCellContainer.layer.frame.height / 2
        
        filledColorView.layer.cornerRadius =  filledColorView.layer.frame.height / 2
    }
    
    func configure(with colorHex: String, isSelected: Bool) {
            filledColorView.backgroundColor = UIColor(hex: colorHex)
            
            collectionCellContainer.layer.borderColor = isSelected
                ? UIColor.systemBlue.cgColor
                : UIColor.gray.withAlphaComponent(0.5).cgColor
            collectionCellContainer.layer.borderWidth = isSelected ? 3 : 2
        }

}


extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let g = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
