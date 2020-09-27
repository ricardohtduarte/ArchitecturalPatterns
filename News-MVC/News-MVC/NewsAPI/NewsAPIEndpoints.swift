//
//  NewsAPIEndpoints.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 19/08/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import Foundation

enum NewsAPIEndpoint {
    case topHeadlines(country: String?, sources: String?, category: String?, query: String?)
    case everything(domains: String?, sortBy: String?, from: String?, to: String?)
    case sources(language: String?, country: String?)
}

extension NewsAPIEndpoint: Endpoint {
    var baseURL: String? {
        "newsapi.org"
    }

    var path: String {
        switch self {
        case .topHeadlines:
            return "/v2/top-headlines"
        case .everything:
            return "/v2/everything"
        case .sources:
            return "/v2/sources"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .topHeadlines(let country, let sources, let category, let query):
            return getTopHeadlinesQueryItems(country: country, sources: sources, category: category, query: query)
        case .everything(let domains, let sortBy, let from, let to):
            return getEverythingQueryItems(domains: domains, sortBy: sortBy, from: from, to: to)
        case .sources(let language, let country):
            return getSourcesQueryItems(language: language, country: country)
        }
    }

    var httpMethod: HTTPMethod { .get }
}


private extension NewsAPIEndpoint {
    func getTopHeadlinesQueryItems(country: String?, sources: String?, category: String?, query: String?) -> [URLQueryItem] {
        var topHeadlinesQueryItems: [URLQueryItem] = []
        if let country = country { topHeadlinesQueryItems.append(URLQueryItem(name: "country", value: country)) }
        if let sources = sources { topHeadlinesQueryItems.append(URLQueryItem(name: "sources", value: sources)) }
        if let category = category { topHeadlinesQueryItems.append(URLQueryItem(name: "category", value: category)) }
        if let query = query { topHeadlinesQueryItems.append(URLQueryItem(name: "query", value: query)) }
        topHeadlinesQueryItems.append(URLQueryItem(name: "apiKey", value: "9ae791cc00924bd58baa6f0efad605c1"))
        return topHeadlinesQueryItems
    }

    func getEverythingQueryItems(domains: String?, sortBy: String?, from: String?, to: String?) -> [URLQueryItem] {
        var everythingQueryItems: [URLQueryItem] = []
        if let domains = domains { everythingQueryItems.append(URLQueryItem(name: "domains", value: domains)) }
        if let sortBy = sortBy { everythingQueryItems.append(URLQueryItem(name: "sortBy", value: sortBy)) }
        if let from = from { everythingQueryItems.append(URLQueryItem(name: "from", value: from)) }
        if let to = to { everythingQueryItems.append(URLQueryItem(name: "to", value: to)) }
        return everythingQueryItems
    }

    func getSourcesQueryItems(language: String?, country: String?) -> [URLQueryItem] {
        var sourcesQueryItems: [URLQueryItem] = []
        if let language = language { sourcesQueryItems.append(URLQueryItem(name: "language", value: language)) }
        if let country = country { sourcesQueryItems.append(URLQueryItem(name: "country", value: country)) }
        return sourcesQueryItems
    }
}
