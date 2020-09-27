//
//  TopHeadlines.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 20/09/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import Foundation

struct TopHeadlines: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

struct Article: Codable, Equatable, Hashable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    static func ==(lhs: Article, rhs: Article) -> Bool {
        return lhs.source == rhs.source
            && lhs.author == rhs.author
            && lhs.title == rhs.title
            && lhs.description == rhs.description
            && lhs.url == rhs.url
            && lhs.urlToImage == rhs.urlToImage
            && lhs.publishedAt == rhs.publishedAt
            && lhs.content == rhs.content
    }
}

struct Source: Codable, Equatable, Hashable {
    let id: String?
    let name: String?

    static func ==(lhs: Source, rhs: Source) -> Bool {
        return lhs.id == lhs.id && lhs.name == rhs.name
    }
}


