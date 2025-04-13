//
//  HTMLDescriptionTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit
import WebKit

class HTMLDescriptionTableCell: UITableViewCell, CustomCell {
    
    @IBOutlet weak var webView: UIView!
    
    var wkWebView: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        wkWebView = WKWebView(frame: webView.bounds)
        wkWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        wkWebView.scrollView.isScrollEnabled = true
        wkWebView.isOpaque = false
        wkWebView.backgroundColor = .clear
        wkWebView.scrollView.bounces = false
        
        webView.addSubview(wkWebView)
        
        contentView.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
    }
    
    func configure(withModel model: any CustomCellEntity) {
        let cellEntity = model as? ProductDetailsCellEntity
        let modelData = cellEntity?.model as? Item
        
        let htmlContent = modelData?.description?.html ?? ""
        wkWebView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
