//
//  TransactionCell.swift
//  test-profit-loss
//
//  Created by Michael Solimini on 6/12/17.
//  Copyright © 2017 Alpha Dev. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    @IBOutlet weak var classificationLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(transaction: Transaction) {
        classificationLbl.text = transaction.Classification
        descriptionLbl.text = transaction.TransDescription
        amountLbl.text = transaction.Amount
    }
    
}
