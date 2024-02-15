//
//  DetailView.swift
//  TaskKatsun3
//
//  Created by 渡邊 翔矢 on 2023/12/16.
//

import SwiftUI

struct ItemDetailView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text(item.title)
            Text("Created at: \(item.createdAt)")
            Text("User: \(item.user.name)")
        }
        .padding()
    }
}
