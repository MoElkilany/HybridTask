//
//  SwiftUIColorCollectionView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import SwiftUI

struct SwiftUIColorCollectionView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel
    @State private var selectedColor: ValueModel?

    var body: some View {
        VStack {
            HStack(spacing:3){
                Spacer()

                if let name = selectedColor?.label {
                    Text(name)
                        .textStyle(DefaultTextStyle(
                            color: .black,
                            fontSize: 12,
                            fontweight: .bold)
                        )
                }
                
                Text(viewModel.productInfo?.configurableOptions?.first?.label ?? "")
                    .textStyle(DefaultTextStyle(
                        color: .black,
                        fontSize: 12,
                        fontweight: .bold)
                    )
            }

            SwiftUIColorCollectionItemsView(viewModel: viewModel, selectedColor: $selectedColor)
        }
        .padding()

    }
}

#Preview {
    SwiftUIColorCollectionView(viewModel: SwiftUIProductDetailsViewModel() )
}

struct SwiftUIColorCollectionItemsView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel
    @Binding var selectedColor: ValueModel?

    var body: some View {
        HStack {
            Spacer()
            if let colorValues = viewModel.productInfo?
                .configurableOptions?
                .first?.values?.reversed() {
                ForEach(colorValues, id: \.valueIndex) { item in
                    ColorCircle(
                        colorHex: item.swatchData?.value ?? "",
                        isSelected: selectedColor?.valueIndex == item.valueIndex
                    ) {
                        selectedColor = item
                    }
                }
            }
        }
    }
}


struct ColorCircle: View {
    let colorHex: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        let color = Color(hex: colorHex)
        
        return Circle()
            .fill(color)
            .frame(width: 30, height: 30)
            .overlay(
                Circle()
                    .stroke(Color.gray.opacity(0.5), lineWidth: 2)
            )
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth: isSelected ? 3 : 0)
            )
            .onTapGesture {
                onTap()
            }
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
