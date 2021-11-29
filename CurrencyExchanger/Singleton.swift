//
//  Singleton.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 28.11.2021.
//

import Foundation

//Mark: -Singleton

class Singleton {
    static let shared = Singleton()
    
    var charrCode = "RUB"
    var leftCharrCode = ""
    var rightCharrCode = "EUR"
    var switcherForCharrs = true
    
    var calcValuteLeft : Float = 0.00
    var calcValuteRight : Float = 1.00
    
    var observerFloatLeft : Float = 0.00  {
        didSet {
            calcValuteLeft = currencyParsedDictionary[leftCharrCode] ?? 0.00
            observerFloatLeft = observerFloatLeft * calcValuteRight / calcValuteLeft
    }
}
    
    var observerFloatRight: Float = 0.00 { 
        didSet {
            calcValuteRight = currencyParsedDictionary[rightCharrCode] ?? 0.00
            observerFloatRight = observerFloatRight * calcValuteLeft / calcValuteRight
        }
    }
    
    var currencyParsedDictionary : [String : Float] = [:]
    
    var shortNamesOfValutes = ["AUD", "AZN", "AMD", "BYN", "BGN", "BRL", "HUF", "KRW", "HKD", "DKK", "USD", "EUR", "INR", "KZT", "CAD", "KGS", "CNY", "MDL", "TMT", "NOK", "PLN","RUB", "RON", "XDR", "SGD", "TJS", "TRY", "UZS", "UAH", "GBP", "CZK", "SEK", "CHF","ZAR","JPY"]

    var fullNamesOfValutes = ["Австралийский доллар", "Азербайджанский манат", "Армянских драмов", "Белорусский рубль", "Болгарский лев", "Бразильский реал", "Венгерских форинтов", "Вон Республики Корея", "Гонконгских долларов", "Датская крона", "Доллар США", "Евро", "Индийских рупий", "Казахстанских тенге", "Канадский доллар", "Киргизских сомов", "Китайский юань", "Молдавских леев", "Новый туркменский манат", "Норвежских крон", "Польский злотый","Российский рубль", "Румынский лей", "СДР (специальные права заимствования)", "Сингапурский доллар", "Таджикских сомони", "Турецких лир", "Узбекских сумов", "Украинских гривен", "Фунт стерлингов Соединенного королевства", "Чешских крон", "Шведских крон", "Швейцарский франк", "Южноафриканских рэндов", "Японских иен"]

}
