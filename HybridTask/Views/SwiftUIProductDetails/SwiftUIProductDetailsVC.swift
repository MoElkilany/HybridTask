//
//  SwiftUIProductDetailsVC.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//

import SwiftUI
import Combine

struct SwiftUIProductDetailsVC: View {
    @StateObject var viewModel = SwiftUIProductDetailsViewModel()
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack {
                SwiftUINavigationBarView(viewModel: viewModel)
                ScrollView {
                    SwiftUILocalProductView(viewModel: viewModel)
                    ImageSlideshowView(viewModel: viewModel)
                    ShareAndFavView()
                    ProductSubDetailsView(viewModel: viewModel)
                    SwiftUIColorCollectionView(viewModel: viewModel)
                    SwiftUIEnterQuantityView(viewModel: viewModel)
                    SwiftUIPriceView(viewModel: viewModel)
                    SwiftUITabsView(viewModel: viewModel)
                }
                .padding(.bottom, keyboardHeight > 0 ? keyboardHeight : 100)
                Spacer()
            }

            VStack {
                Spacer()
                SwiftUITotalPriceView(viewModel: viewModel)
            }
        }
        .ignoresSafeArea(.all)
        .onAppear {
            viewModel.fetchProductDetails()
        }
        .onReceive(Publishers.keyboardHeight) { height in
            self.keyboardHeight = height
        }
    }

}
