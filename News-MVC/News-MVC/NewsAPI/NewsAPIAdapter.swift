//
//  NewsAPIRouter.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 20/09/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import Foundation

final class NewsAPIAdapter {
    let network: NetworkFactory = NetworkFactory()

    func fetchArticles(endpoint: NewsAPIEndpoint,
                       completion: @escaping (Result<TopHeadlines, Error>) -> Void) {
        guard let url = endpoint.url else {
            fatalError("Error: could not create TopHeadlines URL")
        }
        network.fetch(url: url, httpMethod: endpoint.httpMethod) { (result: Result<TopHeadlines, Error>) in
            completion(result)
        }
    }
}
