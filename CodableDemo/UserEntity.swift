//
//  MovieEntity.swift
//  CodableDemo
//
//  Created by Manish on 28/11/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation

struct UserEntity: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

struct Datum: Codable {
    let id: Int
    let firstName, lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
