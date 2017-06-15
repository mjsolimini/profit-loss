//
//  Transaction.swift
//  test-profit-loss
//
//  Created by Michael Solimini on 6/12/17.
//  Copyright © 2017 Alpha Dev. All rights reserved.
//

import Foundation

class Transaction: NSObject, NSCoding {
    
    private var _Classification: String!
    private var _TransDescription: String!
    private var _Amount: String!
    
    var Classification: String {
        return _Classification
    }
    
    var TransDescription: String {
        return _TransDescription
    }
    
    var Amount: String {
        return _Amount
    }
    
    init(Classification: String, TransDescription: String, Amount: String) {
        self._Classification = Classification
        self._TransDescription = TransDescription
        self._Amount = Amount
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._Classification = aDecoder.decodeObject(forKey: "Classification") as? String
        self._TransDescription = aDecoder.decodeObject(forKey: "TransDescription") as? String
        self._Amount = aDecoder.decodeObject(forKey: "Amount") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._Classification, forKey: "Classification")
        aCoder.encode(self._TransDescription, forKey: "TransDescription")
        aCoder.encode(self._Amount, forKey: "Amount")
    }
    
}
