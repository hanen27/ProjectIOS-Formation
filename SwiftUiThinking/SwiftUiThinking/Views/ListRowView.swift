//
//  ListRowView.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 17/11/2022.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ?"checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1  = ItemModel(title: "First item", isCompleted: false)
    static var previews: some View {
        ListRowView(item: item1)
    }
}
