//
//  ArabicNumberFormatter.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 14/04/2025.
//

import Foundation

struct ArabicNumberFormatter {
    static func formattedArabicNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "،"
        let westernFormatted = formatter.string(from: NSNumber(value: number)) ?? "0"
        return convertToArabicNumerals(westernFormatted)
    }

    private static func convertToArabicNumerals(_ western: String) -> String {
        let arabicDigits: [Character] = ["٠","١","٢","٣","٤","٥","٦","٧","٨","٩"]
        return western.reduce("") { result, char in
            if let digit = char.wholeNumberValue {
                return result + String(arabicDigits[digit])
            } else {
                return result + String(char)
            }
        }
    }
}
