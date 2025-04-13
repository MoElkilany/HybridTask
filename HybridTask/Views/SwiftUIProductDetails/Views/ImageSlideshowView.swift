//
//  ImageSlideshowView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import SwiftUI

struct ImageSlideshowView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel

    @State  var currentPage = 0
   
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<(viewModel.productInfo?.mediaGallery?.count ?? 0) , id: \.self) { index in
                    if let urlString = viewModel.productInfo?.mediaGallery?[index].url, let url = URL(string: urlString) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                        .tag(index)
                    }
                }
            }
            .frame(height: 200)
            .cornerRadius(10)
            .padding(.vertical, 10)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

        }
    }
    
}


#Preview {
    ImageSlideshowView(viewModel: SwiftUIProductDetailsViewModel(), currentPage: 1)
}
