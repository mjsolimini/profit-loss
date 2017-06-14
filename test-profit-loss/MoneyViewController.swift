//
//  MoneyViewController.swift
//  So-You-Want-Lemonade
//
//  Created by Michael Solimini on 3/25/17.
//  Copyright © 2017 Alpha Dev. All rights reserved.
//

import UIKit

class MoneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ExpTotal: UILabel!
    @IBOutlet weak var ProfitTotal: UILabel!
    @IBOutlet weak var RevTotal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ExpTotal.textColor = UIColor.red
        RevTotal.textColor = UIColor.green
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: Selector(("onTransactionsLoaded:")), name: NSNotification.Name(rawValue: "transactionsLoaded"), object: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = DataService.instance.loadedTransactions[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as? TransactionCell {
            cell.configureCell(transaction: transaction)
            return cell
        } else {
            let cell = TransactionCell()
            cell.configureCell(transaction: transaction)
            return cell
        }
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedTransactions.count
    }
    
    func onTransactionsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
}
