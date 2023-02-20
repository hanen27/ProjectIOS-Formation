//
//  itemModel.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 17/11/2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
