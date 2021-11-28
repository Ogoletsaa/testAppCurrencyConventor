//
//  Model.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 28.11.2021.
//

import Foundation

//MARK: Properties
struct Main: Codable {
    let disclaimer : String
    let date : String
    let timestamp : Int
    let base : String
    let rates : Dictionary <String, Float>
}


//I Failed parsing here :<

//struct Main: Codable {
//    let Date : String
//    let PreviousDate : String
//    let PreviousURL : String
//    let Timestamp : String
//    let Valute : Valute
//}
//
//struct Valute : Codable {
//    var AUD,AZN,GBP,AMD,BYN,BGN,BRL,HUF,
//        HKD,DKK,USD,EUR,INR,KZT,CAD,KGS,
//        CNY,MDL,NOK,PLN,RON,XDR,SGD,TJS,
//        TRY,TMT,UZS,UAH,CZK,SEK,CHF,ZAR,
//        KRW,JPY : CurrencyItems
//}
//struct CurrencyItems : Codable {
//    let ID : String
//    let NumCode : String
//    let CharCode : String
//    let Nominal : Int
//    let Name : String
//    let Value : Float
//    let Previous : Float
//}
