//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Calist Dsouza on 2025-12-19.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
//    @AppStorage("left_currency") var leftCurrency : Currency = .silverPenny.rawValue
//    @AppStorage("right_currency") var rightCurrency : Currency = .goldPenny.rawValue
    
    @State var leftCurrency = Currency.silverPenny
    @State var rightCurrency : Currency = .goldPenny
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
//            Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .onTapGesture {
                    leftTyping = false
                    rightTyping = false
                }
            
            VStack{
//                Prancing Pony Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
//                Currency Exchange Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
//                Conversion Section
                
                HStack{
//                    Left Conversion Section
                    VStack {
//                        Currency
                        HStack{
//                            Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
//                            Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
//                        Text Field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                    }
                    
//                    Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
//                    Right Conversion Section
                    VStack {
                        //                        Currency
                        HStack{
                            //                            Currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //                            Currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom, -5)
//                        Text Field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .onTapGesture {
                    showSelectCurrency.toggle()
                    currencyTip.invalidate(reason: .actionPerformed)
                }
                .keyboardType(.decimalPad)
               
                
                
                Spacer()
                
//                Info Button
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                }
                
                
            }
//            .border(.blue)
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping{
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping{
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency){
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency){
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showSelectCurrency){
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo){
            ExchangeInfo()
        }
    }
}

#Preview {
    ContentView()
}
