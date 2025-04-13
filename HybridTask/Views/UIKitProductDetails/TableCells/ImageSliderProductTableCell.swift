//
//  ImageSliderProductTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit
import ImageSlideshow
import ImageSlideshowKingfisher

class ImageSliderProductTableCell: UITableViewCell, CustomCell {
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var imageSliderProduct: ImageSlideshow!
    var imageSources: [InputSource] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pageIndicator.currentPageIndicatorTintColor = .systemBlue
           pageIndicator.pageIndicatorTintColor = .lightGray

           imageSliderProduct.pageIndicator = nil

           imageSliderProduct.slideshowInterval = 0
           imageSliderProduct.contentScaleMode = .scaleAspectFill
           imageSliderProduct.currentPageChanged = { [weak self] page in
               self?.pageIndicator.currentPage = page
           }
    }
    
    func configure(withModel model: any CustomCellEntity) {
        guard let cellEntity = model as? ProductDetailsCellEntity,
              let product = cellEntity.model ,
              let mediaGallery = product.mediaGallery else { return }
        
        
        imageSources = mediaGallery.compactMap  { item in
            if let urlString = item.url, let url = URL(string: urlString) {
                return KingfisherSource(url: url)
            }
            return nil
        }
        
        imageSliderProduct.setImageInputs(imageSources)
        
        pageIndicator.numberOfPages = imageSources.count
          pageIndicator.currentPage = 0
    }
    

}
