//
//  QuoteRepository.swift
//  FamousQuotesParse
//
//  Created by Cormell, David - DPC on 18/03/2025.
//

import Foundation

class QuoteRepository {
    static let shared = QuoteRepository()
    
    private init() {}
    
    func saveQuote(quote: Quote) {
        let quoteDao = QuoteDAO(author: quote.author, content: quote.content)
        do {
            try quoteDao.save()
        } catch {
            print("Failing to save quote: \(quote.content)")
        }
    }
    
    func getAllQuotes(completion: @escaping ([Quote]) -> Void) {
        let query = QuoteDAO.query().order([.descending("createdAt")])
        query.find() { response in
            let quotes: [Quote] = (try? response.get())?.compactMap({
                guard let author = $0.author, let content = $0.content else { return nil }
                return Quote(author: author, content: content)
            }) ?? []
            
            completion(quotes)
            
        }
    }
    
    func deleteQuote(id: String) {
        let query = QuoteDAO.query()
        query.find() { response in
            do {
                let items = try response.get()
                
                for item in items {
                    guard let author = item.author, let content = item.content else { return }
                    if ("\(author)\(content)" == id) {
                        do {
                            try item.delete()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            } catch { }
        }
    }
}
