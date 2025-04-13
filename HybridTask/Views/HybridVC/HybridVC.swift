//
//  HybridVC.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//


import UIKit
import Combine
import SwiftUI

class HybridVC:BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBackground()
        
       
    }
    
    @IBAction func swiftUIActionBtn(_ sender: Any) {
        let swiftUIProductDetailsVC = SwiftUIProductDetailsVC()
        let hostingSwiftUIVC = UIHostingController(rootView: swiftUIProductDetailsVC)
        hostingSwiftUIVC.modalPresentationStyle = .overFullScreen
        present(hostingSwiftUIVC, animated: true, completion: nil)
    }
    
    
     @IBAction func uiKitActionBtn(_ sender: Any) {
        let vc = UIKitProductDetailsVC()
         vc.modalPresentationStyle = .overFullScreen
         self.present(vc, animated: true)
    }
    
    
     func addGradientBackground() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
            gradientLayer.colors = [
                UIColor.systemBlue.cgColor,
                UIColor.systemTeal.cgColor
            ]
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    
    

}



