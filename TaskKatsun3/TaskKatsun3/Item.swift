//
//  Item.swift
//  TaskKatsun3
//
//  Created by 渡邊 翔矢 on 2023/12/16.
//

import Foundation

struct Item: Decodable, Identifiable {
    let title: String
    let createdAt: String
    let user: User
    let url: URL
    
    var id: String { title }
    
    enum CodingKeys: String, CodingKey {
        case title
        case createdAt = "created_at"
        case user
        case url
    }
}

struct User: Decodable {
    let name: String
    let profileImageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileImageURL = "profile_image_url"
    }
}
