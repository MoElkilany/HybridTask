//
//  ShareAndFavView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import SwiftUI

struct ShareAndFavView: View {
    var body: some View {
        HStack{
            Image(.fav)
                .resizable()
                .frame(width: 30 , height: 30)
            Spacer().frame(width: 15)
            
            Image(.share)
                .resizable()
                .frame(width: 30, height: 30)
            Spacer()
        }
        .padding(.horizontal,12)
        
        
    }
    
}

#Preview {
    ShareAndFavView()
}



