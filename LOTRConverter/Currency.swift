//
//  Currency.swift
//  LOTRConverter
//
//  Created by Calist Dsouza on 2025-12-20.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable{
//    CaseIterable makes the enum iterable in a loop.
//    identifiable gives each case a unique id for it to be iterable.
    var id: Currency{ self }
    
    case copperPenny = 6400
    case copperPiece = 124
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
             .copperpenny
        case .copperPiece:
             .goldpenny
        case .silverPenny:
             .silverpenny
        case .silverPiece:
             .silverpiece
        case .goldPenny:
             .goldpenny
        case .goldPiece:
             .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Peny"
        case .copperPiece:
            "Copper Piece"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    func convert(_ amountString : String, to currency : Currency) -> String {
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        return String(format: "%.2f", convertedAmount)
    }
}
