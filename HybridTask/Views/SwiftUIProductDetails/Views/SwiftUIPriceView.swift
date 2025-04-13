//
//  SwiftUIPriceView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import SwiftUI

struct SwiftUIPriceView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel

    var body: some View {
        HStack{
            
            Button {
                
            } label: {
                Text(
                    "تغير العملة "
                )
                .textStyle(
                    DefaultTextStyle(
                        color:.blue ,
                        fontSize: 16,
                        fontweight: .bold
                    )
                )
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.blue)
                        .offset(y: -5),
                    alignment: .bottom
                )
            }

            Spacer()
            
            HStack{
                Text(
                    viewModel.productInfo?.priceRange?.maximumPrice?.regularPrice?.currency == "YER" ? "ريال جديد" : "USD"
                )
                .textStyle(
                    DefaultTextStyle(
                        color:.black ,
                        fontSize: 16,
                        fontweight: .bold
                    )
                )
                Text(
                    ArabicNumberFormatter
                        .formattedArabicNumber(
                            viewModel.pricePerQuantity()
                        )
                )
                .textStyle(
                    DefaultTextStyle(
                        color:.black ,
                        fontSize: 16,
                        fontweight: .bold
                    )
                )
            }
            
     
            
        }
        .padding()
        .onAppear(){
            viewModel.fetchProductDetails()
        }
    }
}

#Preview {
    SwiftUIPriceView(viewModel: SwiftUIProductDetailsViewModel() )
}
