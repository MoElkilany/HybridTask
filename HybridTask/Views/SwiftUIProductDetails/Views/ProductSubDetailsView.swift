//
//  ProductSubDetailsView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//



import SwiftUI

struct ProductSubDetailsView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.productInfo?.name ?? ""  )
                    .textStyle(
                        DefaultTextStyle(
                            color:.black ,
                            fontSize: 13,
                            fontweight: .regular
                        )
                    )
                    .multilineTextAlignment(.trailing)
                Spacer()
            }
            .padding(.leading,12)
            .padding(.top,12)

            HStack(spacing: 0){
                Spacer()
                Text("البائع:")
                    .textStyle(
                        DefaultTextStyle(
                            color:.gray ,
                            fontSize: 12,
                            fontweight: .regular
                        )
                    )
                    .multilineTextAlignment(.trailing)
                Text(viewModel.productInfo?.vendorInfo?.storeName ?? "" )
                    .textStyle(
                        DefaultTextStyle(
                            color:.gray ,
                            fontSize: 12,
                            fontweight: .regular
                        )
                    )
                    .multilineTextAlignment(.trailing)
                Text("-")
                    .textStyle(
                        DefaultTextStyle(
                            color:.gray ,
                            fontSize: 12,
                            fontweight: .regular
                        )
                    )
                    .multilineTextAlignment(.trailing)
                Text(viewModel.productInfo?.sku ?? ""  )
                    .textStyle(
                        DefaultTextStyle(
                            color:.gray ,
                            fontSize: 12,
                            fontweight: .regular
                        )
                    )
                    .multilineTextAlignment(.trailing)
                Text("  كود المنتج : ")
                    .textStyle(
                        DefaultTextStyle(
                            color:.gray ,
                            fontSize: 12,
                            fontweight: .regular
                        )
                    )
                    .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal,14)
            Divider()
                .foregroundColor(Color.gray.opacity(0.1))
                .padding(.horizontal,12)
            
            HStack{
                Spacer()
                HStack(spacing: 2){
                    Text(viewModel.productInfo?.stockStatus  == "IN_STOCK"  ? "متوفر في المخزن" : "-"  )
                        .textStyle(
                            DefaultTextStyle(
                                color:.black ,
                                fontSize: 10,
                                fontweight: .bold
                            )
                        )
                    Image(.checkmark)
                        .resizable()
                        .frame(width: 12, height: 12)
                }
                
                Spacer().frame(width: 20)
                
                HStack(spacing: 2){
                    Text(viewModel.productInfo?.shipTo?.period ?? ""  )
                        .textStyle(
                            DefaultTextStyle(
                                color:.systemBlue ,
                                fontSize: 10,
                                fontweight: .bold
                            )
                        )
                    Text(viewModel.productInfo?.shipTo?.shipToPrefix ?? ""  )
                        .textStyle(
                            DefaultTextStyle(
                                color:.black ,
                                fontSize: 10,
                                fontweight: .bold
                            )
                        )
                    if let icon = viewModel.productInfo?.shipTo?.icon, !icon.isEmpty {
                        SVGImageView(svgString: icon)
                            .frame(width: 12, height: 12)
                    }
                }
                
              
            }
            .padding(14)
            
            
            Divider()
                .foregroundColor(Color.gray.opacity(0.1))
                .padding(.horizontal,12)
            
        }
    }
}

#Preview {
    ShareAndFavView()
}
