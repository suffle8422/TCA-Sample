//
//  SampleList.swift
//  TCA-Sample
//
//  Created by ionishi on 2023/09/15.
//

import Foundation
import ComposableArchitecture

struct Content: Equatable, Identifiable {
    let id = UUID()
    var text: String
}

struct SampleList: Reducer {
    struct State: Equatable {
        var contents: IdentifiedArrayOf<Content> = []
    }
    
    enum Action: Equatable {
        case addButtonTapped
        case cellTapped(UUID)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                return .none
                
            case let .cellTapped(id):
                debugPrint("hoge","cellTapped", id)
                return .none
            }
        }
    }
}
