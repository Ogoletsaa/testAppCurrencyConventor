//
//  ViewController.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 28.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: -Values
    var singleShared = Singleton.shared

    //MARK: -Outlets

    @IBOutlet weak var leftCurrencyID: UILabel!
    @IBOutlet weak var leftCurrencyValue: UITextField!
    @IBOutlet weak var rightCurrencyID: UILabel!
    @IBOutlet weak var rightCurrencyValue: UITextField!
    @IBOutlet weak var mainViewOutlet: UIView!
    
    //MARK: -Actions
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
    
    @IBAction func leftChangeValueButton() {
        //Segue to CurrencySelectionViewController
        let vc = storyboard?.instantiateViewController(identifier: "CurrencySelectionVC") as! CurrencySelectionViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        singleShared.switcherForCharrs = true
    }
    
    @IBAction func rightChangeValueButton() {
        //Segue to CurrencySelectionViewController
        let vc = storyboard?.instantiateViewController(identifier: "CurrencySelectionVC") as! CurrencySelectionViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        singleShared.switcherForCharrs = false
        
    }
    
    //MARK: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.leftCurrencyValue.keyboardType = UIKeyboardType.numberPad
        self.rightCurrencyValue.keyboardType = UIKeyboardType.numberPad
        fetchJSON()
        singleShared.calcValuteLeft = singleShared.currencyParsedDictionary["RUB"] ?? 0.00
        singleShared.calcValuteRight = singleShared.currencyParsedDictionary["EUR"] ?? 0.00
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        switchCharrs()
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
                self.singleShared.currencyParsedDictionary["RUB"] = Float(1.00)
                self.singleShared.calcValuteRight = self.singleShared.currencyParsedDictionary["EUR"] ?? 0.00
            } catch {
                print(error)
            }
        }.resume()
    }
        
    func switchCharrs(){
        
        if singleShared.switcherForCharrs == true {
            singleShared.leftCharrCode = singleShared.charrCode
            leftCurrencyID.text = singleShared.leftCharrCode
            
        } else {
            singleShared.rightCharrCode = singleShared.charrCode
            rightCurrencyID.text = singleShared.rightCharrCode
        }
                        
    }
}

