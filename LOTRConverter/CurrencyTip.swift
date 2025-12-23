//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Calist Dsouza on 2025-12-22.
//

import TipKit

struct CurrencyTip : Tip{
    var title = Text("Change Currency")
    
    var message: Text? = Text("Tap on any currency to change it.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
