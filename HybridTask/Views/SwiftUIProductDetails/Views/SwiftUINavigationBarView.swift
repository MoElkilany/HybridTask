//
//  SwiftUINavigationBarView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import SwiftUI
struct SwiftUINavigationBarView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack{
            VStack{
                Spacer().frame(height: 50)
                HStack{
                    Image(.cart)
                    Text(viewModel.productInfo?.name ?? ""  )
                        .textStyle(DefaultTextStyle(color:.white ,fontSize: 22,fontweight: .bold))
                        .multilineTextAlignment(.center)
                    Button {
                        dismiss()
                    } label: {
                        Image(.rightArrow)
                    }
                }
            }
            .padding(.horizontal,12)
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color(.systemBlue), Color(.systemTeal)]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
        }
    }
}




#Preview {
    SwiftUINavigationBarView(viewModel: SwiftUIProductDetailsViewModel())
}
