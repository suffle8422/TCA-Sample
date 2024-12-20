//
//  ContactsFeature.swift
//  TCA-Sample
//
//  Created by Ibuki Ohnishi on 2023/09/15.
//

import Foundation
import ComposableArchitecture

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

struct ContactsFeature: Reducer {
    struct State: Equatable {
        @PresentationState var addContact: AddContactFeature.State?
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action: Equatable {
        case addButtonTapped
        case addContact(PresentationAction<AddContactFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.addContact = AddContactFeature.State(
                    contact: Contact(id: UUID(), name: "")
                )
                return .none
                
            case let .addContact(.presented(.delegate(.saveContact(contact)))):
                    state.contacts.append(contact)
                    return .none
                
            case .addContact:
                return .none
            }
        }.ifLet(\.$addContact, action: /Action.addContact) {
            AddContactFeature()
        }
    }
}
