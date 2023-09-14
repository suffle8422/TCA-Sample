//
//  AddContactFeature.swift
//  TCA-Sample
//
//  Created by Ibuki Ohnishi on 2023/09/15.
//

import Foundation
import ComposableArchitecture

struct AddContactFeature: Reducer {
    struct State: Equatable {
        var contact: Contact
    }
    
    enum Action: Equatable {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
        
        case delegate(Delegate)
        enum Delegate: Equatable {
            case saveContact(Contact)
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .cancelButtonTapped:
            return .run { _ in 
                await self.dismiss()
            }
            
        case .saveButtonTapped:
            return .run { [contact = state.contact] send in
                await send(.delegate(.saveContact(contact)))
                await self.dismiss()
            }
            
        case let .setName(name):
            state.contact.name = name
            return .none
            
        case .delegate:
            return .none
        }
    }
}
