//
//  TCA_ContactsApp.swift
//  TCA_Contacts
//
//  Created by Herve Peroteau on 23/03/2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_ContactsApp: App {
    static let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
    }

    var body: some Scene {
        WindowGroup {
            ContactsView(store: Self.store)
        }
    }
}
