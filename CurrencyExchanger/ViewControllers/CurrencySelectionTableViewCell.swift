//
//  CurrencySelectionTableViewCell.swift
//  CurrencyExchanger
//
//  Created by Артем Оголец on 28.11.2021.
//

import UIKit

class CurrencySelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var initialsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
