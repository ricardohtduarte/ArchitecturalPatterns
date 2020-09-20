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

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}


