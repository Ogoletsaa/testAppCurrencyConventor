//
//  CurrencySelectionViewController.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 28.11.2021.
//

import UIKit

class CurrencySelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: -Outlets
    @IBOutlet weak var tableViewOutlet: UITableView!
       
    //MARK: -Actions
    @IBAction func confirmButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
        
    //MARK: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //tableViewOutlet.tableFooterView = UIView()
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
        
        guard let cell = tableView.cellForRow(at: indexPath) as? CurrencySelectionTableViewCell else { return }
        cell.confirmButtonOutlet.isHidden = false
        Singleton.shared.charrCode = Singleton.shared.shortNamesOfValutes[indexPath.row]
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? CurrencySelectionTableViewCell else { return }
        cell.confirmButtonOutlet.isHidden = true
    }
 
    

}
