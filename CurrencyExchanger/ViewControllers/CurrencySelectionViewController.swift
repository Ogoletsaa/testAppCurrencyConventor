//
//  CurrencySelectionViewController.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 28.11.2021.
//

import UIKit

class CurrencySelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    //MARK: Values
    var currencyDict : [String : Float] = [:]
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.rowHeight = 64

    }

    //MARK: -Cell customization
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.shortNamesOfValutes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "currencySelectionCell", for: indexPath) as! CurrencySelectionTableViewCell
        
        customCell.currencyNameLabel.text = Singleton.shared.fullNamesOfValutes[indexPath.row]
        customCell.initialsLabel.text = Singleton.shared.shortNamesOfValutes[indexPath.row]
        
        return customCell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        Singleton.shared.charrCode = Singleton.shared.shortNamesOfValutes[indexPath.row]
        print(Singleton.shared.charrCode)

    }
    
    

}
