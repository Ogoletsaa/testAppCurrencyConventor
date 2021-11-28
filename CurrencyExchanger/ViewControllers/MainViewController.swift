//
//  ViewController.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 28.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: Values

    var singleShared = Singleton.shared
    
    //MARK: Outlets

    @IBOutlet weak var leftCurrencyID: UILabel!
    @IBOutlet weak var leftCurrencyValue: UITextField!
    @IBOutlet weak var rightCurrencyID: UILabel!
    @IBOutlet weak var rightCurrencyValue: UITextField!
    @IBOutlet weak var mainViewOutlet: UIView!
    
    //MARK: Actions
    @IBAction func leftCurrencyActionIDButton(_ sender: Any) {
        let theText = leftCurrencyValue.text ?? ""
        let float = Float(theText) ?? 0.0
        singleShared.observerFloatLeft = float
        rightCurrencyValue.text = String(singleShared.observerFloatLeft)
        
    }

    @IBAction func rightCurrencyActionIDButton(_ sender: Any ) {
        let theText = rightCurrencyValue.text ?? ""
        let float = Float(theText) ?? 0.0
        singleShared.observerFloatRight = float
        leftCurrencyValue.text = String(singleShared.observerFloatRight)
    }
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.leftCurrencyValue.keyboardType = UIKeyboardType.numberPad
        self.rightCurrencyValue.keyboardType = UIKeyboardType.numberPad
       
        fetchJSON()
        
    }
    
    func fetchJSON() {
        let urlStringJSON = "https://www.cbr-xml-daily.ru/latest.js"

        guard let url = URL(string: urlStringJSON) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            //Decode data
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Main.self, from: data)

                    //Fill dictionary with values
                self.singleShared.currencyParsedDictionary = jsonData.rates
                self.singleShared.tempValuteLeft = jsonData.rates["EUR"] ?? 0.00
                self.singleShared.tempValuteRight = jsonData.rates["USD"] ?? 0.00
            } catch {
                print(error)
            }
        }.resume()


    }
}

