//
//  ContactsFeature.swift
//  TCA_Contacts
//
//  Created by Herve Peroteau on 23/03/2024.
//

import Foundation
import ComposableArchitecture

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

@Reducer
struct ContactsFeature {
    @ObservableState
    struct State: Equatable {
        var contacts: IdentifiedArrayOf<Contact> = []
        @Presents var addContact: AddContactFeature.State?
    }
    
    enum Action {
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
        }
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactFeature()
        }
    }
}
