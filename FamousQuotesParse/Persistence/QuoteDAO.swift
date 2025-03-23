//
//  QuoteDAO.swift
//  FamousQuotesParse
//
//  Created by Cormell, David - DPC on 18/03/2025.
//

import Foundation
import ParseSwift

struct QuoteDAO: ParseObject {
    //Parse protocol properties
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    
    //custom properties
    var author: String?
    var content: String?
}
