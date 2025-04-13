//
//  SwiftUIEnterQuantityView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import SwiftUI

struct SwiftUIEnterQuantityView: View {
    
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel


    var body: some View {
        HStack{
            VStack {
                TextField(
                    "",
                    text: $viewModel.quantityNumber,
                    prompt: Text("1")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                )
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .padding(10)
            }
            .frame(width: 100, height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, lineWidth: 1))
            Spacer()
            Text("اخل الكمية : ")
                .textStyle(DefaultTextStyle(color: .black, fontSize: 16, fontweight: .bold))
        }
        .padding()
    }
}


