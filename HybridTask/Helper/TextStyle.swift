//
//  TextStyle.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//

import SwiftUI


protocol TextStyle: ViewModifier {}

extension Text {
    func textStyle<T: TextStyle>(_ style: T) -> some View {
        modifier(style)
    }
}


struct DefaultTextStyle: TextStyle {
    var color: UIColor = .systemBlue
    var fontSize: CGFloat
    var fontweight : Font.Weight = .regular
    func body(content: Content) -> some View {
        content
            .font(cairoFont(size: fontSize, weight: fontweight))
            .foregroundColor(Color(color))
    }
    
    private  func cairoFont(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let fontName: String
        
        switch weight {
        case .bold:
            fontName = FontName.cairoBold.rawValue
        default:
            fontName = FontName.cairoRegular.rawValue
        }
        
        return .custom(fontName, size: size)
    }
}


enum FontName:String {
    case cairoBold = "Cairo-Bold"
    case cairoRegular = "Cairo-Regular"
}
