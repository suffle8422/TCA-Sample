//
//  SampleListView.swift
//  TCA-Sample
//
//  Created by ionishi on 2023/09/15.
//

import SwiftUI
import ComposableArchitecture

struct SampleListView: View {
    let store: StoreOf<SampleList>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            List(viewStore.state.contents) { content in
                SampleListCell(content: content) {
                    viewStore.send(.cellTapped(content.id))
                }
            }
        }
    }
}

#Preview {
    SampleListView(
        store: Store(initialState: SampleList.State(
            contents: [
                Content(text: "aaa"),
                Content(text: "bbb"),
                Content(text: "ccc")
            ])) {
            SampleList()
                ._printChanges()
        }
    )
}
