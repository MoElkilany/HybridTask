//
//  SwiftUIAdditionalInfoView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import SwiftUI

struct SwiftUIAdditionalInfoView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel

    var body: some View {
        VStack {
            ForEach(
                viewModel.productInfo?.attributes ??  [] ,
                id: \.self
            ) { attribute in
                VStack{
                    HStack {
                        Text(attribute.value ?? "" )
                            .textStyle(
                                DefaultTextStyle(
                                    color: .black,
                                    fontSize: 12,
                                    fontweight:  .bold
                                )
                            )
                        Spacer()
                        Text(attribute.label ?? "" )
                            .textStyle(
                                DefaultTextStyle(
                                    color: .black,
                                    fontSize: 12,
                                    fontweight: .bold
                                )
                            )
                    }
                    .padding(8)
                }
                .padding(8)
                .background(content: { Color.blue.opacity(0.1) })
                .cornerRadius(8)
            }
        }
        .padding()
 
    }
        
}

#Preview {
    SwiftUIAdditionalInfoView(viewModel: SwiftUIProductDetailsViewModel())
}
