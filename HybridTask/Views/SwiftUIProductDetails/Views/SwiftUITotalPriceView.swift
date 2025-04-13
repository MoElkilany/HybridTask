//
//  SwiftUITotalPriceView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//

import SwiftUI

struct SwiftUITotalPriceView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel

    var body: some View {
        VStack{
            HStack{
                Text(
                    viewModel.productInfo?.priceRange?.maximumPrice?.regularPrice?.currency == "YER" ? "ريال جديد" : "USD"
                )
                .textStyle(
                    DefaultTextStyle(
                        color:.black ,
                        fontSize: 16,
                        fontweight: .regular
                    )
                )
                
                Text( ArabicNumberFormatter.formattedArabicNumber(
                        viewModel.pricePerQuantity()
                    ))
                .textStyle(
                    DefaultTextStyle(
                        color: .black,
                        fontSize: 16,
                        fontweight:  .regular
                    )
                )
                Spacer()
                Text("الإجمالي :")
                    .textStyle(
                        DefaultTextStyle(
                            color: .black,
                            fontSize: 16,
                            fontweight:  .regular
                        )
                    )
                
                
            }
            .padding(.horizontal)
            
            Button {
                    
            } label: {
                VStack{
                    Text("إضافة الي السلة ")
                        .textStyle(
                            DefaultTextStyle(
                                color: .white,
                                fontSize: 20,
                                fontweight:  .regular
                            )
                        )
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.blue)
                .cornerRadius(25)
                .padding(.horizontal)
            }
        }
        
        .padding()
        .background(Color.white)
        .cornerRadius(22, corners: [.topLeft, .topRight])
        .shadow(color: .gray, radius: 10, x: 0, y: 5)
        
    }
}

#Preview {
    SwiftUITotalPriceView(viewModel: SwiftUIProductDetailsViewModel())
}
