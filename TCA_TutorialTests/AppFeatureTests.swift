//
//  AppFeatureTests.swift
//  TCA_TutorialTests
//
//  Created by Herve Peroteau on 23/03/2024.
//

import Foundation
import ComposableArchitecture
import XCTest
@testable import TCA_Tutorial

@MainActor
final class AppFeatureTests: XCTestCase {
    func testIncrementInFirstTab() async {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }

        await store.send(\.tab1.incrementButtonTapped) {
            $0.tab1.count = 1
        }

    }
}
