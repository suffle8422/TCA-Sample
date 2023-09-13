//
//  TCA_SampleApp.swift
//  TCA-Sample
//
//  Created by ionishi on 2023/09/13.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_SampleApp: App {
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: TCA_SampleApp.store)
        }
    }
}
