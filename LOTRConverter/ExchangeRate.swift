//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Calist Dsouza on 2025-12-19.
//
import SwiftUI


struct ExchangeRate: View {
    
    let leftImage : ImageResource
    let text : String
    let rightImage : ImageResource
    
    var body: some View {
        HStack{
            
            //                    left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            //                    exchange rate text
            Text(text)
            
            //                    right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}
    
#Preview {
    ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
}
