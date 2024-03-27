//
//  BookStoreDM.swift
//  BookStoreApp
//
//  Created by Smita Kankayya on 27/03/24.
//

import Foundation

struct BookStoreDM: Codable {
    let books: [Book]
}

struct Book: Codable {
    let title: String
    let subtitle: String
    let isbn13: String
    let price: String
    let image: String
    let url: String
}
