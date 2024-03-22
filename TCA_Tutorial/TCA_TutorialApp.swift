//
//  TCA_TutorialApp.swift
//  TCA_Tutorial
//
//  Created by Herve Peroteau on 22/03/2024.
//

import ComposableArchitecture
import SwiftUI

@main
struct MyApp: App {
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }

    var body: some Scene {
        WindowGroup {
            CounterView(store: MyApp.store)
        }
    }
}
