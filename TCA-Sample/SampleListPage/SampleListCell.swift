//
//  SampleListCell.swift
//  TCA-Sample
//
//  Created by ionishi on 2023/09/15.
//

import SwiftUI

struct SampleListCell: View {
    var content: Content
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            cellContent
        })
        .foregroundColor(.black)
    }
    
    var cellContent: some View {
        VStack {
            Text(content.id.description)
                .lineLimit(1)
            Text(content.text)
        }
    }
}

#Preview {
    SampleListCell(content: Content(text: "テスト用のセルです")) {
        debugPrint("hoge", "セルがタップされた")
    }
}
