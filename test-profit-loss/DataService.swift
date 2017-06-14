//
//  DataService.swift
//  test-profit-loss
//
//  Created by Michael Solimini on 6/14/17.
//  Copyright © 2017 Alpha Dev. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    let KEY_TRANSACTIONS = "transactions"
    
    private var _loadedTransactions = [Transaction]()
    
    var loadedTransactions: [Transaction] {
        return _loadedTransactions
    }
    
    func saveTransactions() {
        let transactionsData = NSKeyedArchiver.archivedData(withRootObject: _loadedTransactions)
        UserDefaults.standard.set(transactionsData, forKey: KEY_TRANSACTIONS)
    }
    
    func loadTransactions() {
        if let transactionsData = UserDefaults.standard.object(forKey: KEY_TRANSACTIONS) as? NSData {
            if let transactionsArray = NSKeyedUnarchiver.unarchiveObject(with: transactionsData as Data) as? [Transaction] {
                _loadedTransactions = transactionsArray
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "transactionsLoaded"), object: nil)
        
    }
    
    func addTransaction(transaction: Transaction) {
        _loadedTransactions.append(transaction)
        saveTransactions()
        loadTransactions()
    }
    
}
