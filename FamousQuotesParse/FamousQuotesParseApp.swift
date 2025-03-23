//
//  FamousQuotesParseApp.swift
//  FamousQuotesParse
//
//  Created by Cormell, David - DPC on 18/03/2025.
//

import SwiftUI
import ParseSwift

@main
struct FamousQuotesParseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: FamousQuotesViewModel())
        }
    }
    
    init() {
        // Replace placeholders with your Back4App credentials
        ParseSwift.initialize(
            applicationId: "oAuQtLr2KgGebywcz7KZ6Pdpokck33o4GAWpiUjs",
            clientKey: "K6mMB9AARQCNLGON3y9QkKmFAd2T2y2iThNWPQ1X",
            serverURL: URL(string: "https://parseapi.back4app.com")!
        )
    }
}
