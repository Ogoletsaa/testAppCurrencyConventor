//
//  Singleton.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 28.11.2021.
//

import Foundation

//Mark: Singleton

class Singleton {
    static let shared = Singleton()
    
    var charrCode = "PLN"
    var tempValuteLeft : Float = 1.00 
    var tempValuteRight : Float = 0.00
    
    var observerFloatLeft : Float = 0.00  { //RUB
        didSet {
            observerFloatLeft = observerFloatLeft * tempValuteLeft / tempValuteRight
            
    }
}
    
    var observerFloatRight: Float = 0.00 { //EUR
        didSet {
            observerFloatRight = observerFloatRight * tempValuteRight / tempValuteLeft
        }
    }
    
    var currencyParsedDictionary : [String : Float] = [:]
    
    let shortNamesOfValutes = ["AUD", "AZN", "AMD", "BYN", "BGN", "BRL", "HUF", "KRW", "HKD", "DKK", "USD", "EUR", "INR", "KZT", "CAD", "KGS", "CNY", "MDL", "TMT", "NOK", "PLN", "RON", "XDR", "SGD", "TJS", "TRY", "UZS", "UAH", "GBP", "CZK", "SEK", "CHF","ZAR","JPY"]

    let fullNamesOfValutes = ["Австралийский доллар", "Азербайджанский манат", "Армянских драмов", "Белорусский рубль", "Болгарский лев", "Бразильский реал", "Венгерских форинтов", "Вон Республики Корея", "Гонконгских долларов", "Датская крона", "Доллар США", "Евро", "Индийских рупий", "Казахстанских тенге", "Канадский доллар", "Киргизских сомов", "Китайский юань", "Молдавских леев", "Новый туркменский манат", "Норвежских крон", "Польский злотый", "Румынский лей", "СДР (специальные права заимствования)", "Сингапурский доллар", "Таджикских сомони", "Турецких лир", "Узбекских сумов", "Украинских гривен", "Фунт стерлингов Соединенного королевства", "Чешских крон", "Шведских крон", "Швейцарский франк", "Южноафриканских рэндов", "Японских иен"]

}
