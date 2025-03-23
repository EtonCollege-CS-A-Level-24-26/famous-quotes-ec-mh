//
//  FamousQuotesViewModel.swift
//  FamousQuotesParse
//
//  Created by Cormell, David - DPC on 18/03/2025.
//

import Foundation
import ParseSwift

@Observable
class FamousQuotesViewModel {
    var quotes: [Quote]
    var isShowingAddQuote: Bool
    var newQuoteAuthor: String
    var newQuoteContent: String
    
    init() {
        self.quotes = []
        self.isShowingAddQuote = false
        self.newQuoteAuthor = ""
        self.newQuoteContent = ""
    }
    
    func restoreQuotes() {
        QuoteRepository.shared.getAllQuotes(completion: { quotes in
            self.quotes = quotes
        })
    }
    
    func addNewQuote() {
        let quote = Quote(author: newQuoteAuthor, content: newQuoteContent)
        quotes.insert(quote, at: 0)
        QuoteRepository.shared.saveQuote(quote: quote)
        newQuoteAuthor = ""
        newQuoteContent = ""
        isShowingAddQuote = false
    }
    
    func deleteQuote(quote: Quote) {
        QuoteRepository.shared.deleteQuote(id: quote.id)
    }
}
