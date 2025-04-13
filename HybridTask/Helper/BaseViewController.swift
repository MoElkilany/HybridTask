//
//  BaseViewController.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    static func instantiate() -> Self {
        let id = String(describing: self)
        let nib = UINib(nibName: id, bundle: Bundle.main)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! Self
    }
    
    func registerCell(id: String, tableView: UITableView) {
        let nib = UINib(nibName: id, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: id)
    }

    func registerCollectionCell(id: String, collectionView: UICollectionView) {
        let nib = UINib(nibName: id, bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: id)
    }

    
    func applyGradientToNavigationBar(customView:UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame =  customView.bounds
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemTeal.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        let maskPath = UIBezierPath(
            roundedRect: customView.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 20, height: 20)
        )

        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        gradientLayer.mask = maskLayer
        customView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

extension UIResponder {
    static func getName() -> String {
        return String(describing: self)
    }
}
