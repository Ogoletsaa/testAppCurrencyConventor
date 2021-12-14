//
//  Network.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 14.12.2021.
//

import Foundation

class NetworkService {
    
    let urlStringJSON = "https://www.cbr-xml-daily.ru/latest.js"
    
    func fetchJSON() {
        
        guard let url = URL(string: urlStringJSON) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            //Decode data
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Main.self, from: data)

                //Fill dictionary with values
                Singleton.shared.currencyParsedDictionary = jsonData.rates
                Singleton.shared.currencyParsedDictionary["RUB"] = Float(1.00)
                Singleton.shared.calcValuteRight = Singleton.shared.currencyParsedDictionary["EUR"] ?? 0.00
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
