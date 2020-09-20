//
//  NewsAPIRouter.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 20/09/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import Foundation

final class NewsAPIRouter {
    let network: NetworkFactory = NetworkFactory()

    func fetchTopHeadlines(country: String?,
                           sources: String?,
                           category: String?,
                           query: String?,
                           completion: @escaping (Result<TopHeadlines, Error>) -> Void) {
        let endpoint = NewsAPI.topHeadlines(country: country, sources: sources, category: category, query: query)
        guard let url = endpoint.url else {
            fatalError("Error: could not create TopHeadlines URL")
        }
        network.fetch(url: url, httpMethod: endpoint.httpMethod) { (result: Result<TopHeadlines, Error>) in
            completion(result)
        }
    }
}
