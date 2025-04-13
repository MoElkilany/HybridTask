//
//  LocalProductTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit
import SVGKit

class LocalProductTableCell: UITableViewCell,CustomCell {

    
    var modelData: Item?
    @IBOutlet weak var svgImage: SVGKFastImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withModel model: any CustomCellEntity) {
        let cellEntity = model as? ProductDetailsCellEntity
        self.modelData = cellEntity?.model as? Item
        
        if let labelText = modelData?.labels?.first?.labelText, !labelText.isEmpty {
            loadSVG(from: labelText)
        }
    }
    
    private func loadSVG(from svgString: String) {
        guard let data = svgString.data(using: .utf8) else {
            return
        }
        let svgImage = SVGKImage(data: data)
                if let svgImage = svgImage {
            self.svgImage.image = svgImage
        }
    }
}
