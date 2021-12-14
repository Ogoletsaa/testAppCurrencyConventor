//
//  ViewController.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 28.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: -Values
    let singleShared = Singleton.shared
    let networkService = NetworkService()

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
        networkService.fetchJSON()
        singleShared.calcValuteLeft = singleShared.currencyParsedDictionary["RUB"] ?? 0.00
        singleShared.calcValuteRight = singleShared.currencyParsedDictionary["EUR"] ?? 0.00
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        switchCharrs()
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

