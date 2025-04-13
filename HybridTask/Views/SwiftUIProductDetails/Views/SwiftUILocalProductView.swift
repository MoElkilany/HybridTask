//
//  SwiftUILocalProductView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//


import SwiftUI
import SVGKit

struct SwiftUILocalProductView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel
    var body: some View {
        HStack{
            Spacer()
            if let labelText = viewModel.productInfo?.labels?.first?.labelText, !labelText.isEmpty {
                SVGImageView(svgString: labelText)
                    .frame(width: 30, height: 20)
     
            }
        }
        .padding(22)
        .padding(.leading,22)
        
    }
}


struct SVGImageView: UIViewRepresentable {
    let svgString: String
    
    func makeUIView(context: Context) -> SVGKFastImageView {
        guard let data = svgString.data(using: .utf8) else {
            return SVGKFastImageView(svgkImage: nil)
        }
        let svgImage = SVGKImage(data: data)
        return SVGKFastImageView(svgkImage: svgImage)
    }
    
    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {}
}
