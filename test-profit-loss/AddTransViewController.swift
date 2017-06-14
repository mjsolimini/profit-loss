//
//  AddTransViewController.swift
//  So-You-Want-Lemonade
//
//  Created by Michael Solimini on 3/25/17.
//  Copyright © 2017 Alpha Dev. All rights reserved.
//

import UIKit
import CoreData

class AddTransViewController: UIViewController {

    @IBOutlet weak var WhatWasExp: UILabel!
    @IBOutlet weak var ExpDesc: UITextField!
    @IBOutlet weak var ExpInput: UITextField!
    @IBOutlet weak var HowMuchExp: UILabel!
    @IBOutlet weak var NotesBox: UITextField!
    @IBOutlet weak var NotesLbl: UILabel!
    @IBOutlet weak var HowManyCupSelector: UIStepper!
    @IBOutlet weak var HowManyCupsNum: UILabel!
    @IBOutlet weak var HowManyCups: UILabel!
    @IBOutlet weak var HowMuchCup: UILabel!
    @IBOutlet weak var HowMuchCupSelector: UIStepper!
    @IBOutlet weak var NumberOfCups: UILabel!
    @IBOutlet weak var MainLbl: UILabel!
    @IBOutlet weak var SegmentController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainLbl.text = "Sale"
        MainLbl.textColor = UIColor.green
        ExpDesc.isHidden = true
        ExpInput.isHidden = true
        HowMuchExp.isHidden = true
        WhatWasExp.isHidden = true
        NumberOfCups.text = "$0.00"
        HowManyCupsNum.text = "0"
    }

    @IBAction func SegmentController(_ sender: Any) {
        if SegmentController.selectedSegmentIndex == 0 {
            MainLbl.text = "Sale"
            MainLbl.textColor = UIColor.green
            HowMuchCup.isHidden = false
            HowManyCups.isHidden = false
            HowManyCupSelector.isHidden = false
            HowManyCupsNum.isHidden = false
            HowMuchCupSelector.isHidden = false
            NumberOfCups.isHidden = false
            NotesBox.isHidden = false
            NotesLbl.isHidden = false
            ExpDesc.isHidden = true
            ExpInput.isHidden = true
            HowMuchExp.isHidden = true
            WhatWasExp.isHidden = true
        }
        
        if SegmentController.selectedSegmentIndex == 1 {
            MainLbl.text = "Expense"
            MainLbl.textColor = UIColor.red
            HowMuchCup.isHidden = true
            HowManyCups.isHidden = true
            HowManyCupSelector.isHidden = true
            HowManyCupsNum.isHidden = true
            HowMuchCupSelector.isHidden = true
            NumberOfCups.isHidden = true
            NotesBox.isHidden = true
            NotesLbl.isHidden = true
            ExpDesc.isHidden = false
            ExpInput.isHidden = false
            HowMuchExp.isHidden = false
            WhatWasExp.isHidden = false
        }
    }
    
    @IBAction func HowMuchIsACup(_ sender: UIStepper) {
        NumberOfCups.text = "$ \(String(sender.value))"
    }
    
    @IBAction func HowManyCupsStep(_ sender: UIStepper) {
        HowManyCupsNum.text = String(sender.value)
    }
   
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveTransaction(_ sender: Any) {
        
        // two if statements below-one for expense, one for revenue
        
        //Revenue
        if let classi = MainLbl.text, let desc = NotesBox.text , let amt = HowMuchCup.text {
            let transaction = Transaction(Classification: classi, TransDescription: desc, Amount: amt)
            DataService.instance.addTransaction(transaction: transaction)
            dismiss(animated: true, completion: nil)
        }
    }

    
    
}
